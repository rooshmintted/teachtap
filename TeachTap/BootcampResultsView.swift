//
//  BootcampResultsView.swift
//  TeachTap
//
//  Created by Roosh on 7/29/25.
//

import SwiftUI

struct BootcampResultsView: View {
    let examType: ExamType
    let targetScore: String
    let testDate: String
    @State private var showPurchaseFlow = false
    
    var body: some View {
        ZStack {
            // Dark teal background
            LinearGradient(
                gradient: Gradient(colors: [Color(red: 0.15, green: 0.45, blue: 0.55), Color(red: 0.1, green: 0.35, blue: 0.45)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Top navigation
                HStack {
                    Button(action: {
                        print("DEBUG: Back button tapped from bootcamp results")
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                    }
                    .padding(.leading, 16)
                    
                    Spacer()
                }
                .padding(.top, 20)
                
                Spacer()
                    .frame(height: 40)
                
                // Cute green character
                VStack {
                    ZStack {
                        // Character body
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.green)
                            .frame(width: 80, height: 100)
                        
                        VStack(spacing: 0) {
                            // Hat
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.yellow)
                                    .frame(width: 50, height: 20)
                                    .offset(y: -40)
                                
                                // Face
                                VStack(spacing: 4) {
                                    HStack(spacing: 8) {
                                        Circle()
                                            .fill(Color.white)
                                            .frame(width: 8, height: 8)
                                        Circle()
                                            .fill(Color.white)
                                            .frame(width: 8, height: 8)
                                    }
                                    
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(Color.white)
                                        .frame(width: 16, height: 4)
                                }
                                .offset(y: -20)
                            }
                        }
                        
                        // Arms (flexing)
                        HStack(spacing: 100) {
                            // Left arm
                            VStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.green)
                                    .frame(width: 12, height: 30)
                                    .rotationEffect(.degrees(-30))
                                    .offset(x: -10, y: -15)
                            }
                            
                            // Right arm
                            VStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.green)
                                    .frame(width: 12, height: 30)
                                    .rotationEffect(.degrees(30))
                                    .offset(x: 10, y: -15)
                            }
                        }
                        
                        // Legs
                        HStack(spacing: 20) {
                            RoundedRectangle(cornerRadius: 6)
                                .fill(Color.green)
                                .frame(width: 12, height: 25)
                                .offset(y: 35)
                            
                            RoundedRectangle(cornerRadius: 6)
                                .fill(Color.green)
                                .frame(width: 12, height: 25)
                                .offset(y: 35)
                        }
                        
                        // Sparkle effects around character
                        VStack {
                            HStack {
                                Image(systemName: "sparkle")
                                    .foregroundColor(.green)
                                    .font(.system(size: 16))
                                    .offset(x: -60, y: -40)
                                
                                Spacer()
                                
                                Image(systemName: "sparkle")
                                    .foregroundColor(.green)
                                    .font(.system(size: 12))
                                    .offset(x: 50, y: -30)
                            }
                            
                            Spacer()
                            
                            HStack {
                                Image(systemName: "sparkle")
                                    .foregroundColor(.green)
                                    .font(.system(size: 14))
                                    .offset(x: -50, y: 20)
                                
                                Spacer()
                                
                                Image(systemName: "sparkle")
                                    .foregroundColor(.green)
                                    .font(.system(size: 10))
                                    .offset(x: 60, y: 10)
                            }
                        }
                        .frame(width: 200, height: 120)
                    }
                }
                .frame(height: 140)
                
                Spacer()
                    .frame(height: 40)
                
                // Bootcamp details card
                VStack(spacing: 16) {
                    VStack(spacing: 16) {
                        // Main bootcamp card
                        VStack(spacing: 16) {
                            // Calculator icon
                            Circle()
                                .fill(Color.white.opacity(0.2))
                                .frame(width: 60, height: 60)
                                .overlay(
                                    Image(systemName: "calculator")
                                        .font(.system(size: 24))
                                        .foregroundColor(.white)
                                )
                            
                            Text("10-Week Digital \(examType.rawValue) Bootcamp")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            
                            Text("66d 18h 06m 09s until your \(examType.rawValue) exam")
                                .font(.system(size: 16))
                                .foregroundColor(.white.opacity(0.8))
                                .multilineTextAlignment(.center)
                            
                            HStack(spacing: 16) {
                                VStack(spacing: 4) {
                                    Text("Duration")
                                        .font(.system(size: 14))
                                        .foregroundColor(.white.opacity(0.7))
                                    Text("Jul 29 - Oct 03")
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.white.opacity(0.1))
                                )
                                
                                VStack(spacing: 4) {
                                    Text("Deadline to Enroll")
                                        .font(.system(size: 14))
                                        .foregroundColor(.white.opacity(0.7))
                                    Text("Today")
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.white.opacity(0.1))
                                )
                            }
                        }
                        .padding(24)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.1))
                        )
                        .padding(.horizontal, 24)
                    }
                    
                    // Target score card
                    VStack(spacing: 16) {
                        Circle()
                            .fill(Color.green.opacity(0.2))
                            .frame(width: 60, height: 60)
                            .overlay(
                                Image(systemName: "target")
                                    .font(.system(size: 24))
                                    .foregroundColor(.green)
                            )
                        
                        Text("Get a \(targetScore) on \(testDate.components(separatedBy: ",").last?.trimmingCharacters(in: .whitespaces) ?? testDate)")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        VStack(spacing: 8) {
                            Text("To achieve your target score with TeachTap, you'll need to dedicate at least")
                                .font(.system(size: 16))
                                .foregroundColor(.white.opacity(0.8))
                                .multilineTextAlignment(.center)
                            
                            Text("8 Hours Per Week")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                        }
                    }
                    .padding(24)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.green.opacity(0.15))
                    )
                    .padding(.horizontal, 24)
                }
                
                Spacer()
                
                // Learn More button
                Button(action: {
                    print("DEBUG: Learn More button tapped - showing purchase flow")
                    showPurchaseFlow = true
                }) {
                    Text("Learn More")
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
        .sheet(isPresented: $showPurchaseFlow) {
            PurchaseFlowView(examType: examType)
        }
    }
}

#Preview {
    BootcampResultsView(examType: .sat, targetScore: "1480", testDate: "October 4, 2025")
} 