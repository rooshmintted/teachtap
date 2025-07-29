//
//  ContentView.swift
//  TeachTap
//
//  Created by Roosh on 7/29/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    
    var body: some View {
        if showSplash {
            SplashView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            showSplash = false
                        }
                    }
                }
        } else {
            ExamSelectionView()
        }
    }
}

struct SplashView: View {
    var body: some View {
        ZStack {
            // Black background
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                Spacer()
                
                // Logo
                VStack(spacing: 16) {
                    // Custom TeachTap logo
                    ZStack {
                        // Green part of the 't'
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.green)
                            .frame(width: 60, height: 60)
                            .offset(x: 15, y: 0)
                        
                        // White part of the 't'
                        VStack(spacing: 0) {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.white)
                                .frame(width: 70, height: 12)
                                .offset(x: -8, y: -15)
                            
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.white)
                                .frame(width: 12, height: 45)
                                .offset(x: -25, y: 0)
                        }
                    }
                    .frame(width: 80, height: 80)
                    
                    // App name
                    Text("TeachTap")
                        .font(.system(size: 48, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                    // Tagline
                    Text("Making Learning Fun")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                // Loading indicator
                VStack(spacing: 20) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .green))
                        .scaleEffect(1.2)
                    
                    Spacer()
                        .frame(height: 50)
                }
            }
        }
    }
}

struct ExamSelectionView: View {
    var body: some View {
        ZStack {
            // Teal background
            LinearGradient(
                gradient: Gradient(colors: [Color(red: 0.2, green: 0.5, blue: 0.6), Color(red: 0.1, green: 0.4, blue: 0.5)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: 100)
                
                // Title
                Text("Which exams do you want to crush?")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                
                Spacer()
                    .frame(height: 100)
                
                // Exam buttons
                HStack(spacing: 20) {
                    // SAT Button
                    Button(action: {
                        // SAT selection action
                    }) {
                        Text("SAT")
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(width: 140, height: 140)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white.opacity(0.2))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                    )
                            )
                    }
                    
                    // AP Button
                    Button(action: {
                        // AP selection action
                    }) {
                        Text("AP")
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(width: 140, height: 140)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white.opacity(0.2))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                    )
                            )
                    }
                }
                .padding(.horizontal, 40)
                
                Spacer()
                
                // Login text
                HStack(spacing: 4) {
                    Text("Already have an account?")
                        .font(.system(size: 16))
                        .foregroundColor(.white.opacity(0.8))
                    
                    Button(action: {
                        // Login action
                    }) {
                        Text("Log in")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.green)
                    }
                }
                .padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    ContentView()
}
