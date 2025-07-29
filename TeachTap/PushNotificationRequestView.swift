//
//  PushNotificationRequestView.swift
//  TeachTap
//
//  Created by Roosh on 7/29/25.
//

import SwiftUI

struct PushNotificationRequestView: View {
    let examType: ExamType
    let onGetStarted: () -> Void
    
    var body: some View {
        ZStack {
            // Dark teal background to match the screenshot
            LinearGradient(
                gradient: Gradient(colors: [Color(red: 0.15, green: 0.45, blue: 0.55), Color(red: 0.1, green: 0.35, blue: 0.45)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: 120)
                
                // Bell icon with sound waves
                VStack(spacing: 20) {
                    ZStack {
                        // Sound waves
                        HStack(spacing: 16) {
                            // Left sound waves
                            VStack(spacing: 8) {
                                HStack(spacing: 4) {
                                    ForEach(0..<3) { i in
                                        RoundedRectangle(cornerRadius: 2)
                                            .fill(Color.green)
                                            .frame(width: 6, height: 4 + CGFloat(i) * 4)
                                    }
                                }
                            }
                            .rotationEffect(.degrees(15))
                            
                            Spacer()
                                .frame(width: 40)
                            
                            // Bell icon
                            Image(systemName: "bell.fill")
                                .font(.system(size: 64))
                                .foregroundColor(.green)
                            
                            Spacer()
                                .frame(width: 40)
                            
                            // Right sound waves
                            VStack(spacing: 8) {
                                HStack(spacing: 4) {
                                    ForEach(0..<3) { i in
                                        RoundedRectangle(cornerRadius: 2)
                                            .fill(Color.green)
                                            .frame(width: 6, height: 4 + CGFloat(2-i) * 4)
                                    }
                                }
                            }
                            .rotationEffect(.degrees(-15))
                        }
                    }
                    .frame(height: 80)
                }
                
                Spacer()
                    .frame(height: 60)
                
                // Title and description
                VStack(spacing: 16) {
                    Text("Stay Connected & Informed")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    Text("Enable notifications to receive timely reminders and updates for your \(examType.rawValue) study plan. We'll keep you informed about your progress and provide motivational tips to help you stay focused and committed to your goals.")
                        .font(.system(size: 16))
                        .foregroundColor(.white.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .lineSpacing(4)
                        .padding(.horizontal, 40)
                }
                
                Spacer()
                    .frame(height: 60)
                
                // Phone mockup
                VStack {
                    ZStack {
                        // Phone frame
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color.black)
                            .frame(width: 200, height: 400)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 2)
                            )
                        
                        VStack {
                            // Status bar
                            HStack {
                                Text("9:41")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(.white)
                                Spacer()
                                HStack(spacing: 4) {
                                    Image(systemName: "signal")
                                        .font(.system(size: 12))
                                        .foregroundColor(.white)
                                    Image(systemName: "wifi")
                                        .font(.system(size: 12))
                                        .foregroundColor(.white)
                                    Image(systemName: "battery.100")
                                        .font(.system(size: 12))
                                        .foregroundColor(.white)
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.top, 15)
                            
                            Spacer()
                                .frame(height: 20)
                            
                            // Date
                            Text("Monday, June 6")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.white.opacity(0.7))
                            
                            // Time
                            Text("9:41")
                                .font(.system(size: 64, weight: .thin))
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            // Notification
                            HStack {
                                // Profile image
                                Circle()
                                    .fill(Color.brown)
                                    .frame(width: 40, height: 40)
                                    .overlay(
                                        Text("AE")
                                            .font(.system(size: 16, weight: .bold))
                                            .foregroundColor(.white)
                                    )
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    HStack {
                                        Text("Albert Einstein")
                                            .font(.system(size: 14, weight: .semibold))
                                            .foregroundColor(.white)
                                        Spacer()
                                        Text("9:41 AM")
                                            .font(.system(size: 12))
                                            .foregroundColor(.white.opacity(0.7))
                                    }
                                    
                                    HStack {
                                        Image(systemName: "video.fill")
                                            .font(.system(size: 12))
                                            .foregroundColor(.white.opacity(0.7))
                                        Text("Sent you a video")
                                            .font(.system(size: 14))
                                            .foregroundColor(.white.opacity(0.9))
                                    }
                                }
                                
                                Spacer()
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white.opacity(0.15))
                            )
                            .padding(.horizontal, 20)
                            .padding(.bottom, 20)
                            
                            Spacer()
                        }
                    }
                }
                
                Spacer()
                
                // Get Started button
                Button(action: {
                    print("DEBUG: Get Started button tapped in push notification request")
                    onGetStarted()
                }) {
                    Text("Get Started")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.green)
                        )
                }
                .padding(.horizontal, 24)
                
                Spacer()
                    .frame(height: 20)
                
                // Progress indicator
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 134, height: 5)
                    .cornerRadius(2.5)
                
                Spacer()
                    .frame(height: 40)
            }
        }
    }
}

#Preview {
    PushNotificationRequestView(examType: .sat) {
        print("Preview: Get Started tapped")
    }
} 