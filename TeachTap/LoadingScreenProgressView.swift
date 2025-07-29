//
//  LoadingScreenProgressView.swift
//  TeachTap
//
//  Created by Roosh on 7/29/25.
//

import SwiftUI

struct LoadingScreenProgressView: View {
    let onComplete: () -> Void
    
    @State private var progress: Double = 0.0
    @State private var showPercentage: Int = 0
    
    var body: some View {
        ZStack {
            // Dark teal background to match other screens
            LinearGradient(
                gradient: Gradient(colors: [Color(red: 0.15, green: 0.45, blue: 0.55), Color(red: 0.1, green: 0.35, blue: 0.45)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer()
                
                // Title
                Text("Finding the best bootcamp for you...")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                
                Spacer()
                    .frame(height: 80)
                
                // Book icon in circular background
                ZStack {
                    Circle()
                        .fill(Color.green.opacity(0.3))
                        .frame(width: 120, height: 120)
                    
                    Circle()
                        .fill(Color.green.opacity(0.4))
                        .frame(width: 100, height: 100)
                    
                    Image(systemName: "book.fill")
                        .font(.system(size: 48))
                        .foregroundColor(.white)
                }
                
                Spacer()
                    .frame(height: 60)
                
                // Progress percentage
                Text("\(showPercentage)%")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.white.opacity(0.8))
                
                Spacer()
                    .frame(height: 20)
                
                // Progress bar
                VStack(spacing: 8) {
                    GeometryReader { geometry in
                        ZStack(alignment: .leading) {
                            // Background track
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.white.opacity(0.2))
                                .frame(height: 8)
                            
                            // Progress fill
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.green)
                                .frame(width: geometry.size.width * progress, height: 8)
                        }
                    }
                    .frame(height: 8)
                    .padding(.horizontal, 40)
                }
                
                Spacer()
                    .frame(height: 120)
                
                // Progress indicator at bottom
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 134, height: 5)
                    .cornerRadius(2.5)
                
                Spacer()
                    .frame(height: 40)
            }
        }
        .onAppear {
            // Animate progress bar from 0 to 100% over 1 second
            withAnimation(.easeInOut(duration: 1.0)) {
                progress = 1.0
            }
            
            // Animate percentage counter
            let timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
                if showPercentage < 100 {
                    showPercentage += 2 // Increment by 2 every 0.02 seconds to reach 100 in 1 second
                } else {
                    showPercentage = 100
                    timer.invalidate()
                    
                    // Call completion after a brief delay
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        print("DEBUG: Loading complete - navigating to bootcamp results")
                        onComplete()
                    }
                }
            }
            
            // Ensure timer runs
            RunLoop.current.add(timer, forMode: .common)
        }
    }
}

#Preview {
    LoadingScreenProgressView {
        print("Preview: Loading complete")
    }
} 