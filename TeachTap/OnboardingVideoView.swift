//
//  OnboardingVideoView.swift
//  TeachTap
//
//  Created by Roosh on 7/29/25.
//

import SwiftUI

struct OnboardingVideoView: View {
    let examType: ExamType
    let onSkip: () -> Void
    
    var body: some View {
        ZStack {
            // Black background (no video file provided yet)
            Color.black
                .ignoresSafeArea()
            
            VStack {
                // Top navigation
                HStack {
                    Button(action: {
                        // Back action - for now just debug log
                        print("DEBUG: Back button tapped from onboarding video")
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.white.opacity(0.2))
                            .clipShape(Circle())
                    }
                    .padding(.leading)
                    
                    Spacer()
                    
                    // Skip button - made more visible with better styling
                    Button(action: {
                        print("DEBUG: Skip button tapped in onboarding video")
                        onSkip()
                    }) {
                        Text("Skip")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.black)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .background(Color.white)
                            .clipShape(Capsule())
                    }
                    .padding(.trailing)
                }
                .padding(.top, 20)
                
                Spacer()
                
                // Center content - placeholder for video
                VStack(spacing: 20) {
                    // Placeholder content while no video is available
                    VStack(spacing: 16) {
                        Image(systemName: "play.circle.fill")
                            .font(.system(size: 80))
                            .foregroundColor(.white.opacity(0.3))
                        
                        Text("Video will be available here")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.white.opacity(0.7))
                    }
                }
                
                Spacer()
                
                // Bottom content
                VStack(spacing: 20) {
                    // App name and tagline
                    VStack(spacing: 8) {
                        Text("TeachTap, the")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.5), radius: 2, x: 1, y: 1)
                        
                        Text("Smart Way to Learn \(examType.rawValue)")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.white.opacity(0.8))
                            .shadow(color: .black.opacity(0.5), radius: 2, x: 1, y: 1)
                    }
                    
                    Spacer()
                        .frame(height: 40)
                    
                    // Login text
                    HStack(spacing: 4) {
                        Text("Already have an account?")
                            .font(.system(size: 16))
                            .foregroundColor(.white.opacity(0.8))
                        
                        Button(action: {
                            // Login action - debug log for now
                            print("DEBUG: Login button tapped from onboarding video")
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
}

#Preview {
    OnboardingVideoView(examType: .sat) {
        print("Preview: Skip tapped")
    }
} 