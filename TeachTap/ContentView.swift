//
//  ContentView.swift
//  TeachTap
//
//  Created by Roosh on 7/29/25.
//

import SwiftUI

enum ExamType: String, CaseIterable {
    case sat = "SAT"
    case ap = "AP"
}

enum Grade: String, CaseIterable {
    case freshman = "9th grade (Freshman)"
    case sophomore = "10th grade (Sophomore)"
    case junior = "11th grade (Junior)"
    case senior = "12th grade (Senior)"
    case postGrad = "Post-12th grade"
}

struct ContentView: View {
    @State private var showSplash = true
    @State private var selectedExam: ExamType? = nil
    @State private var showOnboarding = false
    @State private var showSignUp = false
    @State private var showPushNotificationRequest = false
    @State private var showBootcampPlacement = false
    
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
        } else if showOnboarding {
            OnboardingVideoView(examType: selectedExam ?? .sat) {
                withAnimation {
                    showOnboarding = false
                    showSignUp = true
                }
            }
        } else if showBootcampPlacement {
            BootcampPlacementView(examType: selectedExam ?? .sat)
        } else if showPushNotificationRequest {
            PushNotificationRequestView(examType: selectedExam ?? .sat) {
                withAnimation {
                    showPushNotificationRequest = false
                    showBootcampPlacement = true
                }
            }
        } else if showSignUp {
            SignUpView(examType: selectedExam ?? .sat) {
                // Navigate to push notification request view
                withAnimation {
                    showSignUp = false
                    showPushNotificationRequest = true
                }
            }
        } else {
            ExamSelectionView { examType in
                selectedExam = examType
                withAnimation {
                    showOnboarding = true
                }
            }
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
    let onExamSelected: (ExamType) -> Void
    
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
                        onExamSelected(.sat)
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
                        onExamSelected(.ap)
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



struct SignUpView: View {
    let examType: ExamType
    let onSignUp: () -> Void
    @State private var name = ""
    @State private var selectedGrade: Grade?
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false
    @State private var acceptMarketing = false
    @State private var showGradeDropdown = false
    @State private var gradeValidationError = false
    
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
                // Top navigation
                HStack {
                    Button(action: {
                        // Back action - debug log for now
                        print("DEBUG: Back button tapped from sign up")
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    .padding(.leading)
                    
                    Spacer()
                }
                .padding(.top, 20)
                
                ScrollView {
                    VStack(spacing: 24) {
                        // Header
                        VStack(spacing: 8) {
                            Text("Sign Up")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(.white)
                            
                            Text("Unlock Your Potential and Crush Your \(examType.rawValue) with TeachTap")
                                .font(.system(size: 16))
                                .foregroundColor(.white.opacity(0.8))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 40)
                        }
                        .padding(.top, 40)
                        
                        VStack(spacing: 20) {
                            // Name field
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Name")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                                
                                TextField("Enter name...", text: $name)
                                    .textFieldStyle(CustomTextFieldStyle())
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("The name you enter here is what the AI tutors will call you. You can change this at any time in your account settings.")
                                    .font(.system(size: 14))
                                    .foregroundColor(.white.opacity(0.7))
                                    .padding(.horizontal, 4)
                            }
                            
                            // Grade field
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Grade")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                                
                                Button(action: {
                                    showGradeDropdown.toggle()
                                }) {
                                    HStack {
                                        Text(selectedGrade?.rawValue ?? "Select grade...")
                                            .foregroundColor(selectedGrade == nil ? .white.opacity(0.5) : .white)
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
                                                    .stroke(gradeValidationError ? Color.red : Color.white.opacity(0.3), lineWidth: 1)
                                            )
                                    )
                                }
                                
                                if gradeValidationError {
                                    Text("Grade is required")
                                        .font(.system(size: 14))
                                        .foregroundColor(.red)
                                        .padding(.horizontal, 4)
                                }
                            }
                            
                            // Email field
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Email Address")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                                
                                TextField("Enter email...", text: $email)
                                    .textFieldStyle(CustomTextFieldStyle())
                                    .keyboardType(.emailAddress)
                                    .autocapitalization(.none)
                            }
                            
                            // Password field
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Password")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                                
                                HStack {
                                    if showPassword {
                                        TextField("Create password...", text: $password)
                                    } else {
                                        SecureField("Create password...", text: $password)
                                    }
                                    
                                    Button(action: {
                                        showPassword.toggle()
                                    }) {
                                        Image(systemName: showPassword ? "eye.slash" : "eye")
                                            .foregroundColor(.white.opacity(0.7))
                                    }
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
                            
                            // Marketing checkbox
                            HStack(alignment: .top, spacing: 12) {
                                Button(action: {
                                    acceptMarketing.toggle()
                                }) {
                                    Image(systemName: acceptMarketing ? "checkmark.circle.fill" : "circle")
                                        .foregroundColor(acceptMarketing ? .green : .white.opacity(0.5))
                                        .font(.title3)
                                }
                                
                                Text("Get personalized learning tips, exclusive newsletters, special promotions and account updates sent to your email.")
                                    .font(.system(size: 14))
                                    .foregroundColor(.white.opacity(0.8))
                                
                                Spacer()
                            }
                            .padding(.top, 8)
                            
                            // Sign Up button
                            Button(action: {
                                if selectedGrade == nil {
                                    gradeValidationError = true
                                } else {
                                    gradeValidationError = false
                                    print("DEBUG: Sign up button tapped - navigating to push notification request")
                                    onSignUp()
                                }
                            }) {
                                Text("Sign Up")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(Color.white.opacity(0.2))
                                    )
                            }
                            .padding(.top, 20)
                            
                            // Terms and Privacy
                            VStack(spacing: 4) {
                                HStack {
                                    Text("By signing up, you agree to TeachTap's")
                                        .font(.system(size: 12))
                                        .foregroundColor(.white.opacity(0.7))
                                    
                                    Button("Terms of Service") {
                                        print("DEBUG: Terms of Service tapped")
                                    }
                                    .font(.system(size: 12))
                                    .foregroundColor(.green)
                                }
                                
                                HStack {
                                    Text("and")
                                        .font(.system(size: 12))
                                        .foregroundColor(.white.opacity(0.7))
                                    
                                    Button("Privacy Policy") {
                                        print("DEBUG: Privacy Policy tapped")
                                    }
                                    .font(.system(size: 12))
                                    .foregroundColor(.green)
                                    
                                    Text(".")
                                        .font(.system(size: 12))
                                        .foregroundColor(.white.opacity(0.7))
                                }
                            }
                            .padding(.top, 8)
                        }
                        .padding(.horizontal, 24)
                        
                        Spacer()
                            .frame(height: 40)
                        
                        // Login text
                        HStack(spacing: 4) {
                            Text("Already have an account?")
                                .font(.system(size: 16))
                                .foregroundColor(.white.opacity(0.8))
                            
                            Button(action: {
                                print("DEBUG: Login button tapped from sign up")
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
            
            // Grade dropdown overlay
            if showGradeDropdown {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        showGradeDropdown = false
                    }
                
                VStack {
                    Spacer()
                    
                    VStack(spacing: 0) {
                        Rectangle()
                            .fill(Color.white)
                            .frame(height: 4)
                            .cornerRadius(2)
                            .padding(.top, 8)
                        
                        ForEach(Grade.allCases, id: \.self) { grade in
                            Button(action: {
                                selectedGrade = grade
                                showGradeDropdown = false
                                gradeValidationError = false
                            }) {
                                HStack {
                                    Text(grade.rawValue)
                                        .font(.system(size: 16))
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                .padding()
                                .background(Color.clear)
                            }
                            
                            if grade != Grade.allCases.last {
                                Divider()
                                    .background(Color.white.opacity(0.2))
                            }
                        }
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.black.opacity(0.8))
                    )
                    .padding(.horizontal, 24)
                    .padding(.bottom, 100)
                }
            }
        }
    }
}





struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                    )
            )
            .foregroundColor(.white)
    }
}

#Preview {
    ContentView()
}
