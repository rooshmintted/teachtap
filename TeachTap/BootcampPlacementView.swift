//
//  BootcampPlacementView.swift
//  TeachTap
//
//  Created by Roosh on 7/29/25.
//

import SwiftUI

struct BootcampPlacementView: View {
    let examType: ExamType
    
    // Form state
    @State private var selectedTestDate: String? = nil
    @State private var targetScore: String? = nil
    @State private var currentScore: String? = nil
    @State private var readingWritingScore: String? = nil
    @State private var mathScore: String? = nil
    
    // Navigation state
    @State private var showLoadingScreen = false
    @State private var showBootcampResults = false
    
    // Dropdown states
    @State private var showDateDropdown = false
    @State private var showTargetScoreDropdown = false
    @State private var showCurrentScoreDropdown = false
    @State private var showReadingWritingDropdown = false
    @State private var showMathDropdown = false
    
    // Test dates
    private let testDates = [
        "August 23, 2025",
        "October 4, 2025", 
        "November 8, 2025",
        "December 6, 2025",
        "March 14, 2026"
    ]
    
    // Score options
    private let targetScores = ["1480", "1470", "1460", "1450", "1440", "1430", "1420", "1410", "1400"]
    private let currentScores = ["Have not taken a test", "Less than 1,000", "1000", "1010", "1020", "1030", "1040", "1050", "1060", "1070", "1080", "1090", "1100", "1110", "1120", "1130", "1140", "1150"]
    private let sectionScores = ["400", "410", "420", "430", "440", "450", "460", "470", "480", "490", "500", "510", "520", "530", "540", "550", "560", "570", "580", "590", "600"]
    
    // Check if all required fields are filled
    private var isFormComplete: Bool {
        let basicFieldsComplete = selectedTestDate != nil && targetScore != nil && currentScore != nil
        
        if currentScore == "Have not taken a test" || currentScore == "Less than 1,000" {
            return basicFieldsComplete
        } else {
            return basicFieldsComplete && readingWritingScore != nil && mathScore != nil
        }
    }
    
    private var shouldShowSectionScores: Bool {
        guard let score = currentScore else { return false }
        return score != "Have not taken a test" && score != "Less than 1,000"
    }
    
    var body: some View {
        if showBootcampResults {
            BootcampResultsView(
                examType: examType,
                targetScore: targetScore ?? "1480",
                testDate: selectedTestDate ?? "October 4, 2025"
            )
        } else if showLoadingScreen {
            LoadingScreenProgressView {
                withAnimation {
                    showLoadingScreen = false
                    showBootcampResults = true
                }
            }
        } else {
            ZStack {
                // Dark teal background to match screenshot
                LinearGradient(
                    gradient: Gradient(colors: [Color(red: 0.15, green: 0.45, blue: 0.55), Color(red: 0.1, green: 0.35, blue: 0.45)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: 80)
                
                // Title
                Text("Get placed in the best bootcamp")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                
                Spacer()
                    .frame(height: 60)
                
                VStack(spacing: 32) {
                    // Test date selection
                    VStack(spacing: 16) {
                        // Calendar icon
                        Circle()
                            .fill(Color.green.opacity(0.2))
                            .frame(width: 60, height: 60)
                            .overlay(
                                Image(systemName: "calendar")
                                    .font(.system(size: 24))
                                    .foregroundColor(.green)
                            )
                        
                        Text("When are you taking the \(examType.rawValue)?")
                            .font(.system(size: 18))
                            .foregroundColor(.white.opacity(0.8))
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            showDateDropdown.toggle()
                        }) {
                            HStack {
                                Text(selectedTestDate ?? "Select Month")
                                    .foregroundColor(selectedTestDate == nil ? .white.opacity(0.5) : .white)
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.white.opacity(0.7))
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white.opacity(0.1))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                    )
                            )
                        }
                        .padding(.horizontal, 24)
                    }
                    
                    // Target score selection  
                    VStack(spacing: 16) {
                        // Target icon
                        Circle()
                            .fill(Color.green.opacity(0.2))
                            .frame(width: 60, height: 60)
                            .overlay(
                                Image(systemName: "target")
                                    .font(.system(size: 24))
                                    .foregroundColor(.green)
                            )
                        
                        Text("Enter your target score")
                            .font(.system(size: 18))
                            .foregroundColor(.white.opacity(0.8))
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            showTargetScoreDropdown.toggle()
                        }) {
                            HStack {
                                Text(targetScore ?? "Select Score")
                                    .foregroundColor(targetScore == nil ? .white.opacity(0.5) : .white)
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.white.opacity(0.7))
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white.opacity(0.1))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                    )
                            )
                        }
                        .padding(.horizontal, 24)
                    }
                    
                    // Current score selection
                    VStack(spacing: 16) {
                        // Document icon
                        Circle()
                            .fill(Color.green.opacity(0.2))
                            .frame(width: 60, height: 60)
                            .overlay(
                                Image(systemName: "doc.text")
                                    .font(.system(size: 24))
                                    .foregroundColor(.green)
                            )
                        
                        Text("Enter your latest practice/real \(examType.rawValue) or PSAT score")
                            .font(.system(size: 18))
                            .foregroundColor(.white.opacity(0.8))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                        
                        Button(action: {
                            showCurrentScoreDropdown.toggle()
                        }) {
                            HStack {
                                Text(currentScore ?? "Select Score")
                                    .foregroundColor(currentScore == nil ? .white.opacity(0.5) : .white)
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.white.opacity(0.7))
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white.opacity(0.1))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                    )
                            )
                        }
                        .padding(.horizontal, 24)
                        
                        // Section scores (only show if current score is selected and not "Have not taken" or "Less than 1,000")
                        if shouldShowSectionScores {
                            HStack(spacing: 16) {
                                VStack(spacing: 8) {
                                    Text("Reading/Writing")
                                        .font(.system(size: 16))
                                        .foregroundColor(.white.opacity(0.8))
                                    
                                    Button(action: {
                                        showReadingWritingDropdown.toggle()
                                    }) {
                                        HStack {
                                            Text(readingWritingScore ?? "Select Score")
                                                .foregroundColor(readingWritingScore == nil ? .white.opacity(0.5) : .white)
                                            Spacer()
                                            Image(systemName: "chevron.down")
                                                .foregroundColor(.white.opacity(0.7))
                                        }
                                        .padding()
                                        .background(
                                            RoundedRectangle(cornerRadius: 12)
                                                .fill(Color.white.opacity(0.1))
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 12)
                                                        .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                                )
                                        )
                                    }
                                }
                                
                                VStack(spacing: 8) {
                                    Text("Math")
                                        .font(.system(size: 16))
                                        .foregroundColor(.white.opacity(0.8))
                                    
                                    Button(action: {
                                        showMathDropdown.toggle()
                                    }) {
                                        HStack {
                                            Text(mathScore ?? "Select Score")
                                                .foregroundColor(mathScore == nil ? .white.opacity(0.5) : .white)
                                            Spacer()
                                            Image(systemName: "chevron.down")
                                                .foregroundColor(.white.opacity(0.7))
                                        }
                                        .padding()
                                        .background(
                                            RoundedRectangle(cornerRadius: 12)
                                                .fill(Color.white.opacity(0.1))
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 12)
                                                        .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                                )
                                        )
                                    }
                                }
                            }
                            .padding(.horizontal, 24)
                        }
                    }
                }
                
                Spacer()
                
                // Next button
                Button(action: {
                    print("DEBUG: Next button tapped in bootcamp placement - form complete: \(isFormComplete)")
                    if isFormComplete {
                        withAnimation {
                            showLoadingScreen = true
                        }
                    }
                }) {
                    Text("Next")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(isFormComplete ? Color.green : Color.gray.opacity(0.3))
                        )
                }
                .disabled(!isFormComplete)
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
            
            // Dropdown overlays
            if showDateDropdown || showTargetScoreDropdown || showCurrentScoreDropdown || showReadingWritingDropdown || showMathDropdown {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        closeAllDropdowns()
                    }
                
                VStack {
                    Spacer()
                    
                    VStack(spacing: 0) {
                        Rectangle()
                            .fill(Color.white)
                            .frame(height: 4)
                            .cornerRadius(2)
                            .padding(.top, 8)
                        
                        ScrollView {
                            VStack(spacing: 0) {
                                if showDateDropdown {
                                    ForEach(testDates, id: \.self) { date in
                                        createDropdownItem(text: date) {
                                            selectedTestDate = date
                                            showDateDropdown = false
                                        }
                                    }
                                } else if showTargetScoreDropdown {
                                    ForEach(targetScores, id: \.self) { score in
                                        createDropdownItem(text: score) {
                                            targetScore = score
                                            showTargetScoreDropdown = false
                                        }
                                    }
                                } else if showCurrentScoreDropdown {
                                    ForEach(currentScores, id: \.self) { score in
                                        createDropdownItem(text: score) {
                                            currentScore = score
                                            showCurrentScoreDropdown = false
                                            // Reset section scores when current score changes
                                            if score == "Have not taken a test" || score == "Less than 1,000" {
                                                readingWritingScore = nil
                                                mathScore = nil
                                            }
                                        }
                                    }
                                } else if showReadingWritingDropdown {
                                    ForEach(sectionScores, id: \.self) { score in
                                        createDropdownItem(text: score) {
                                            readingWritingScore = score
                                            showReadingWritingDropdown = false
                                        }
                                    }
                                } else if showMathDropdown {
                                    ForEach(sectionScores, id: \.self) { score in
                                        createDropdownItem(text: score) {
                                            mathScore = score
                                            showMathDropdown = false
                                        }
                                    }
                                }
                            }
                        }
                        .frame(maxHeight: 300)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.black.opacity(0.9))
                    )
                    .padding(.horizontal, 24)
                    .padding(.bottom, 100)
                }
            }
        }
        }
    }
    
    // Helper function to create dropdown items
    private func createDropdownItem(text: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Text(text)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
            .background(Color.clear)
        }
    }
    
    // Helper function to close all dropdowns
    private func closeAllDropdowns() {
        showDateDropdown = false
        showTargetScoreDropdown = false
        showCurrentScoreDropdown = false
        showReadingWritingDropdown = false
        showMathDropdown = false
    }
}

#Preview {
    BootcampPlacementView(examType: .sat)
} 