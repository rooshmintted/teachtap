import SwiftUI

struct PurchaseFlowView: View {
    let examType: ExamType
    @State private var currentPage = 0
    @State private var showAddAP = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            // Dark teal background
            LinearGradient(
                gradient: Gradient(colors: [Color(red: 0.15, green: 0.45, blue: 0.55), Color(red: 0.1, green: 0.35, blue: 0.45)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            TabView(selection: $currentPage) {
                // Screen 1: Revolutionary AI-First SAT Prep
                Screen1View(examType: examType)
                    .tag(0)
                
                // Screen 2: Unlock Ivy League SAT Secrets
                Screen2View(examType: examType)
                    .tag(1)
                
                // Screen 3: Achieve Your Target Score, Fast
                Screen3View(examType: examType)
                    .tag(2)
                
                // Screen 4: Purchase Screen
                Screen4View(examType: examType, showAddAP: $showAddAP, onDismiss: {
                    print("DEBUG: Dismissing purchase flow")
                    dismiss()
                })
                    .tag(3)
                
                // Screen 5: Money Back Guarantee
                Screen5View(examType: examType)
                    .tag(4)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}

// MARK: - Screen 1: Revolutionary AI-First SAT Prep
struct Screen1View: View {
    let examType: ExamType
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Button(action: {
                    print("DEBUG: Back button tapped from purchase flow screen 1")
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                }
                .padding(.leading, 16)
                
                Spacer()
                
                VStack(spacing: 4) {
                    Circle()
                        .fill(Color.white.opacity(0.2))
                        .frame(width: 50, height: 50)
                        .overlay(
                            Image(systemName: "calculator")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                        )
                    
                    Text("10-Week Digital \(examType.rawValue) Bootcamp")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
            .padding(.top, 20)
            
            Spacer()
                .frame(height: 40)
            
            // Handwritten text
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Spacer()
                    Text("Redefine your learning with cutting-edge AI")
                        .font(.custom("Bradley Hand", size: 18))
                        .foregroundColor(.green)
                        .rotationEffect(.degrees(-2))
                        .padding(.trailing, 40)
                }
                
                HStack {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 50, height: 50)
                        .overlay(
                            VStack(spacing: 2) {
                                Text("24/7")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.white)
                            }
                        )
                        .padding(.leading, 20)
                    
                    Text("personalized guidance & instant feedback")
                        .font(.custom("Bradley Hand", size: 16))
                        .foregroundColor(.green)
                        .rotationEffect(.degrees(-1))
                    
                    Spacer()
                }
                .padding(.top, 20)
            }
            
            Spacer()
                .frame(height: 40)
            
            // Main title
            Text("Revolutionary AI-First SAT Prep")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Spacer()
                .frame(height: 20)
            
            // Description
            Text("Experience a complete reimagining of SAT prep with TeachTap's AI-powered virtual tutors, including historical figures. Benefit from unlimited adaptive practice tests and a level of personalization impossible with traditional methods. Stay motivated and on track to crush the SAT with our groundbreaking approach.")
                .font(.system(size: 16))
                .foregroundColor(.white.opacity(0.8))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Spacer()
                .frame(height: 40)
            
            // Phone mockup with Einstein
            PhoneMockupView1()
            
            Spacer()
            
            // Page indicators
            HStack(spacing: 8) {
                ForEach(0..<4) { index in
                    Circle()
                        .fill(index == 0 ? Color.white : Color.white.opacity(0.3))
                        .frame(width: 8, height: 8)
                }
            }
            
            Spacer()
                .frame(height: 20)
            
            // Next button
            Button(action: {
                print("DEBUG: Next button tapped from screen 1")
                // Handle next action
            }) {
                Text("Next")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 120, height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.green)
                    )
            }
            
            Spacer()
                .frame(height: 40)
        }
    }
}

// MARK: - Screen 2: Unlock Ivy League SAT Secrets
struct Screen2View: View {
    let examType: ExamType
    
    var body: some View {
        VStack(spacing: 0) {
            // Header (same as screen 1)
            HStack {
                Button(action: {
                    print("DEBUG: Back button tapped from purchase flow screen 2")
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                }
                .padding(.leading, 16)
                
                Spacer()
                
                VStack(spacing: 4) {
                    Circle()
                        .fill(Color.white.opacity(0.2))
                        .frame(width: 50, height: 50)
                        .overlay(
                            Image(systemName: "calculator")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                        )
                    
                    Text("10-Week Digital \(examType.rawValue) Bootcamp")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
            .padding(.top, 20)
            
            Spacer()
                .frame(height: 40)
            
            // Handwritten text
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Spacer()
                    Text("Affordable, expert guidance")
                        .font(.custom("Bradley Hand", size: 18))
                        .foregroundColor(.green)
                        .rotationEffect(.degrees(-2))
                        .padding(.trailing, 60)
                }
                
                HStack {
                    Text("High-end tutoring strategies")
                        .font(.custom("Bradley Hand", size: 16))
                        .foregroundColor(.green)
                        .rotationEffect(.degrees(-1))
                        .padding(.leading, 20)
                    
                    Spacer()
                }
            }
            
            Spacer()
                .frame(height: 40)
            
            // Main title
            Text("Unlock Ivy League SAT Secrets")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Spacer()
                .frame(height: 20)
            
            // Description
            Text("TeachTap brings you the proven strategies of top SAT tutors in an AI-powered platform. Access personalized guidance, comprehensive resources, and performance-boosting techniques used by Ivy League tutors, at a fraction of the cost.")
                .font(.system(size: 16))
                .foregroundColor(.white.opacity(0.8))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Spacer()
                .frame(height: 40)
            
            // Phone mockup with historical figures
            PhoneMockupView2()
            
            Spacer()
            
            // Page indicators
            HStack(spacing: 8) {
                ForEach(0..<4) { index in
                    Circle()
                        .fill(index == 1 ? Color.white : Color.white.opacity(0.3))
                        .frame(width: 8, height: 8)
                }
            }
            
            Spacer()
                .frame(height: 20)
            
            // Next button
            Button(action: {
                print("DEBUG: Next button tapped from screen 2")
                // Handle next action
            }) {
                Text("Next")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 120, height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.green)
                    )
            }
            
            Spacer()
                .frame(height: 40)
        }
    }
}

// MARK: - Screen 3: Achieve Your Target Score, Fast
struct Screen3View: View {
    let examType: ExamType
    
    var body: some View {
        VStack(spacing: 0) {
            // Header (same as previous screens)
            HStack {
                Button(action: {
                    print("DEBUG: Back button tapped from purchase flow screen 3")
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                }
                .padding(.leading, 16)
                
                Spacer()
                
                VStack(spacing: 4) {
                    Circle()
                        .fill(Color.white.opacity(0.2))
                        .frame(width: 50, height: 50)
                        .overlay(
                            Image(systemName: "calculator")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                        )
                    
                    Text("10-Week Digital \(examType.rawValue) Bootcamp")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
            .padding(.top, 20)
            
            Spacer()
                .frame(height: 60)
            
            // Handwritten text with arrow
            HStack {
                Text("max score improvement in min time")
                    .font(.custom("Bradley Hand", size: 18))
                    .foregroundColor(.green)
                    .rotationEffect(.degrees(-2))
                    .padding(.leading, 20)
                
                Spacer()
                
                Image(systemName: "arrow.up.right")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.green)
                    .padding(.trailing, 40)
            }
            
            Spacer()
                .frame(height: 40)
            
            // Main title
            Text("Achieve Your Target Score, Fast")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Spacer()
                .frame(height: 20)
            
            // Description
            Text("TeachTap's AI-driven approach accelerates your progress by targeting your strengths and weaknesses. We're so confident in our ability to help you reach your goal that we offer a money-back guarantee.")
                .font(.system(size: 16))
                .foregroundColor(.white.opacity(0.8))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Spacer()
                .frame(height: 40)
            
            // Phone mockup with dashboard
            PhoneMockupView3()
            
            Spacer()
            
            // Page indicators
            HStack(spacing: 8) {
                ForEach(0..<4) { index in
                    Circle()
                        .fill(index == 2 ? Color.white : Color.white.opacity(0.3))
                        .frame(width: 8, height: 8)
                }
            }
            
            Spacer()
                .frame(height: 20)
            
            // Next button
            Button(action: {
                print("DEBUG: Next button tapped from screen 3")
                // Handle next action
            }) {
                Text("Next")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 120, height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.green)
                    )
            }
            
            Spacer()
                .frame(height: 40)
        }
    }
}

// MARK: - Screen 4: Purchase Screen
struct Screen4View: View {
    let examType: ExamType
    @Binding var showAddAP: Bool
    let onDismiss: () -> Void
    @State private var showProfileSetup = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Header with X button
            HStack {
                Button(action: {
                    print("DEBUG: Close button tapped from purchase screen")
                    onDismiss()
                }) {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                }
                .padding(.leading, 16)
                
                Spacer()
                
                VStack(spacing: 4) {
                    Circle()
                        .fill(Color.white.opacity(0.2))
                        .frame(width: 50, height: 50)
                        .overlay(
                            Image(systemName: "calculator")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                        )
                    
                    Text("10-Week Digital \(examType.rawValue) Bootcamp")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
            .padding(.top, 20)
            
            ScrollView {
                VStack(spacing: 24) {
                    Spacer()
                        .frame(height: 20)
                    
                    // Main title
                    Text("Get 1480 on your \(examType.rawValue)")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    // Subtitle
                    Text("Join over 32,000 students who have used TeachTap to crush their exams.")
                        .font(.system(size: 16))
                        .foregroundColor(.white.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                    
                    // Duration and Enroll cards
                    HStack(spacing: 16) {
                        VStack(spacing: 8) {
                            Text("Duration")
                                .font(.system(size: 14))
                                .foregroundColor(.white.opacity(0.7))
                            Text("Jul 29 - Oct 03")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white.opacity(0.1))
                        )
                        
                        VStack(spacing: 8) {
                            Text("Enroll By")
                                .font(.system(size: 14))
                                .foregroundColor(.white.opacity(0.7))
                            Text("Today")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white.opacity(0.1))
                        )
                    }
                    .padding(.horizontal, 24)
                    
                    // Features list
                    VStack(spacing: 16) {
                        FeatureRowView(text: "Unlock Ivy League secrets with affordable, expert SAT guidance")
                        FeatureRowView(text: "Achieve your target score fast with AI-driven, personalized learning")
                        FeatureRowView(text: "Engage with AI tutors for 24/7 support and instant feedback")
                        FeatureRowView(text: "Crush your SAT and get into your dream college")
                        
                        // Money back guarantee feature
                        HStack(alignment: .top, spacing: 12) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 20))
                                .foregroundColor(.green)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Score a 1480 or get your money back")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                                Text("Spend at least 8 hrs/week on TeachTap to get a 1480")
                                    .font(.system(size: 14))
                                    .foregroundColor(.white.opacity(0.7))
                            }
                            
                            Spacer()
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white.opacity(0.05))
                        )
                        .padding(.horizontal, 24)
                    }
                    
                    Spacer()
                        .frame(height: 40)
                    
                    // Pricing
                    VStack(spacing: 8) {
                        HStack(alignment: .firstTextBaseline, spacing: 8) {
                            Text("All for")
                                .font(.system(size: 24, weight: .medium))
                                .foregroundColor(.white)
                            
                            Text("$399")
                                .font(.system(size: 20))
                                .foregroundColor(.white.opacity(0.6))
                                .strikethrough()
                            
                            Text("$199")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(.white)
                        }
                        
                        Text("Limited Time Offer: 50% OFF!")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.green)
                    }
                    
                    // Add AP Program option
                    VStack(spacing: 16) {
                        HStack(alignment: .top, spacing: 16) {
                            Button(action: {
                                showAddAP.toggle()
                                print("DEBUG: Add AP Program toggle: \(showAddAP)")
                            }) {
                                Circle()
                                    .fill(showAddAP ? Color.green : Color.white.opacity(0.3))
                                    .frame(width: 24, height: 24)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Add AP Program")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(.white)
                                
                                Text("Get full access to all our AP courses for 9 months to crush your APs and stand out in college applications.")
                                    .font(.system(size: 14))
                                    .foregroundColor(.white.opacity(0.7))
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .trailing, spacing: 4) {
                                Text("$399")
                                    .font(.system(size: 14))
                                    .foregroundColor(.white.opacity(0.6))
                                    .strikethrough()
                                
                                Text("$100")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                                
                                Text("One-time Offer")
                                    .font(.system(size: 12))
                                    .foregroundColor(.green)
                                
                                Text("Save 75%!")
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(.green)
                            }
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white.opacity(0.05))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(showAddAP ? Color.green : Color.white.opacity(0.2), lineWidth: 1)
                                )
                        )
                        .padding(.horizontal, 24)
                    }
                    
                    // Enroll button
                    Button(action: {
                        print("DEBUG: Enroll Now button tapped - \(showAddAP ? "with" : "without") AP program")
                        // Navigate to profile setup after enrollment
                        showProfileSetup = true
                    }) {
                        Text("Enroll Now for $\(showAddAP ? "299" : "199")")
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
                    
                    // Terms and conditions
                    VStack(spacing: 4) {
                        Text("By enrolling, you agree to our")
                            .font(.system(size: 12))
                            .foregroundColor(.white.opacity(0.7))
                        
                        HStack(spacing: 4) {
                            Button("Terms & Conditions") {
                                print("DEBUG: Terms & Conditions tapped")
                            }
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .underline()
                            
                            Text(",")
                                .font(.system(size: 12))
                                .foregroundColor(.white.opacity(0.7))
                            
                            Button("Privacy Policy") {
                                print("DEBUG: Privacy Policy tapped")
                            }
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .underline()
                            
                            Text("and")
                                .font(.system(size: 12))
                                .foregroundColor(.white.opacity(0.7))
                            
                            Button("Money-back Guarantee Policy") {
                                print("DEBUG: Money-back Guarantee Policy tapped")
                            }
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .underline()
                        }
                    }
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                    
                    Spacer()
                        .frame(height: 40)
                }
            }
        }
        .fullScreenCover(isPresented: $showProfileSetup) {
            ProfileSetupView()
        }
    }
}

// MARK: - Screen 5: Money Back Guarantee
struct Screen5View: View {
    let examType: ExamType
    
    var body: some View {
        VStack(spacing: 0) {
            // Header with back button
            HStack {
                Button(action: {
                    print("DEBUG: Back button tapped from money back guarantee screen")
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                }
                .padding(.leading, 16)
                
                Spacer()
                
                VStack(spacing: 4) {
                    Circle()
                        .fill(Color.white.opacity(0.2))
                        .frame(width: 50, height: 50)
                        .overlay(
                            Image(systemName: "calculator")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                        )
                    
                    Text("10-Week Digital \(examType.rawValue) Bootcamp")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
            .padding(.top, 20)
            
            Spacer()
                .frame(height: 40)
            
            // Money Back badge and handwritten text
            VStack(spacing: 20) {
                // Money Back badge
                ZStack {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 80, height: 80)
                    
                    VStack(spacing: 2) {
                        Text("Money Back")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.white)
                        Text("100%")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                        Text("Guarantee")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
                
                // Handwritten text
                Text("Guaranteed results or your money back!!")
                    .font(.custom("Bradley Hand", size: 18))
                    .foregroundColor(.green)
                    .rotationEffect(.degrees(-2))
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
                .frame(height: 40)
            
            // Main title
            Text("Money Back Guarantee")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
            Spacer()
                .frame(height: 20)
            
            // Description
            Text("We are confident in the effectiveness of TeachTap. If you follow the study plan we provide and don't get your target score, we will give you a refund.")
                .font(.system(size: 16))
                .foregroundColor(.white.opacity(0.8))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            HStack {
                Button("Learn More") {
                    print("DEBUG: Learn More about guarantee tapped")
                }
                .font(.system(size: 16))
                .foregroundColor(.white)
                .underline()
                
                Spacer()
            }
            .padding(.horizontal, 40)
            .padding(.top, 8)
            
            Spacer()
                .frame(height: 60)
            
            // Testimonials section
            VStack(spacing: 20) {
                HStack {
                    Image(systemName: "quote.opening")
                        .font(.system(size: 24))
                        .foregroundColor(.green)
                    
                    Spacer()
                    
                    Image(systemName: "quote.closing")
                        .font(.system(size: 24))
                        .foregroundColor(.green)
                }
                .padding(.horizontal, 40)
                
                Text("What Our Students Say")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                
                Text("Join thousands of successful students who have aced their exams with TeachTap.")
                    .font(.system(size: 16))
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                
                // Testimonial card
                VStack(spacing: 16) {
                    Text("\"TeachTap is fun, it's engaging, and it makes me feel confident to complete my tests.\"")
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    Text("Shaylen Mehta")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                }
                .padding(24)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white.opacity(0.1))
                )
                .padding(.horizontal, 40)
                
                // Navigation arrows
                HStack(spacing: 40) {
                    Button(action: {
                        print("DEBUG: Previous testimonial tapped")
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20))
                            .foregroundColor(.white.opacity(0.7))
                    }
                    
                    Button(action: {
                        print("DEBUG: Next testimonial tapped")
                    }) {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 20))
                            .foregroundColor(.white.opacity(0.7))
                    }
                }
            }
            
            Spacer()
            
            // Page indicators
            HStack(spacing: 8) {
                ForEach(0..<4) { index in
                    Circle()
                        .fill(index == 3 ? Color.white : Color.white.opacity(0.3))
                        .frame(width: 8, height: 8)
                }
            }
            
            Spacer()
                .frame(height: 20)
            
            // Get Started button
            Button(action: {
                print("DEBUG: Get Started button tapped")
                // Handle get started action
            }) {
                Text("Get Started")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 140, height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.green)
                    )
            }
            
            Spacer()
                .frame(height: 40)
        }
    }
}

// MARK: - Helper Views

struct FeatureRowView: View {
    let text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 20))
                .foregroundColor(.green)
            
            Text(text)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}

// MARK: - Phone Mockup Views

struct PhoneMockupView1: View {
    var body: some View {
        ZStack {
            // Phone frame
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.black)
                .frame(width: 200, height: 400)
                .overlay(
                    RoundedRectangle(cornerRadius: 35)
                        .fill(Color.gray.opacity(0.1))
                        .frame(width: 180, height: 380)
                )
            
            // Screen content
            VStack(spacing: 8) {
                // Status bar
                HStack {
                    Text("9:41")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    HStack(spacing: 4) {
                        Image(systemName: "cellularbars")
                        Image(systemName: "wifi")
                        Image(systemName: "battery.100")
                    }
                    .font(.system(size: 10))
                    .foregroundColor(.white)
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                
                // Question content
                VStack(spacing: 12) {
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        Text("Question 2 of 15")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text("21:59")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 16)
                    
                    // Progress bar
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color.blue)
                        .frame(width: 40, height: 4)
                        .padding(.horizontal, 16)
                    
                    // Question text
                    Text("The profit g(x) in dollars from selling a product is modeled by the function g(x) = -300x² + 6,000x, where x is the selling price per unit. At what selling price will the profit be zero dollars?")
                        .font(.system(size: 10))
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                    
                    // User message
                    HStack {
                        Spacer()
                        Text("Can you explain the question for me?")
                            .font(.system(size: 10))
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.blue.opacity(0.7))
                            .cornerRadius(12)
                        
                        Text("9:40 AM")
                            .font(.system(size: 8))
                            .foregroundColor(.white.opacity(0.7))
                    }
                    .padding(.horizontal, 16)
                    
                    // Einstein avatar and response
                    HStack(alignment: .top, spacing: 8) {
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 24, height: 24)
                            .overlay(
                                Text("E")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.white)
                            )
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Certainly, Joe! The function g(x) = -300x² + 6,000x models the profit g(x) based on the selling price x. The graph intersects the x-axis at x = 0 and x = b. At these points, the profit g(x) is zero. Therefore, b represents the selling price that results in a profit of zero dollars, which matches option D. Does this clear things up for you?")
                                .font(.system(size: 9))
                                .foregroundColor(.white)
                                .padding(8)
                                .background(Color.green.opacity(0.7))
                                .cornerRadius(12)
                            
                            Text("9:41 AM")
                                .font(.system(size: 8))
                                .foregroundColor(.white.opacity(0.7))
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                }
                
                Spacer()
            }
        }
    }
}

struct PhoneMockupView2: View {
    var body: some View {
        ZStack {
            // Historical figure avatars around the phone
            VStack {
                HStack {
                    // Einstein (top left)
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 50, height: 50)
                        .overlay(
                            Text("E")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.white)
                        )
                        .offset(x: -80, y: -60)
                    
                    Spacer()
                    
                    // Newton (top right)
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 45, height: 45)
                        .overlay(
                            Text("N")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.white)
                        )
                        .offset(x: 80, y: -40)
                }
                
                Spacer()
                
                HStack {
                    // Lincoln (bottom left)
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 40, height: 40)
                        .overlay(
                            Text("L")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.white)
                        )
                        .offset(x: -70, y: 40)
                    
                    Spacer()
                    
                    // Washington (bottom right)
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 45, height: 45)
                        .overlay(
                            Text("W")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.white)
                        )
                        .offset(x: 70, y: 60)
                }
            }
            .frame(width: 300, height: 400)
            
            // Phone frame
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.black)
                .frame(width: 200, height: 400)
                .overlay(
                    RoundedRectangle(cornerRadius: 35)
                        .fill(Color.gray.opacity(0.1))
                        .frame(width: 180, height: 380)
                )
            
            // Screen content with Isaac Newton
            VStack(spacing: 8) {
                // Status bar
                HStack {
                    Text("9:41")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    HStack(spacing: 4) {
                        Image(systemName: "cellularbars")
                        Image(systemName: "wifi")
                        Image(systemName: "battery.100")
                    }
                    .font(.system(size: 10))
                    .foregroundColor(.white)
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                
                // Header
                HStack {
                    Button(action: {}) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                    }
                    
                    Text("Back to Test")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text("13:23")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 16)
                
                // Newton portrait
                VStack(spacing: 8) {
                    Text("Isaac Newton")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white)
                    
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 80, height: 80)
                        .overlay(
                            Text("IN")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.white)
                        )
                    
                    Text("1x")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                }
                
                // Newton's message
                VStack(alignment: .leading, spacing: 4) {
                    Text("Ah, a misstep in our journey! I've prepared a video to guide you back on track. It's playing above. Need more guidance? Just shoot me a message 😊")
                        .font(.system(size: 9))
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.green.opacity(0.7))
                        .cornerRadius(12)
                    
                    Text("8:40 AM")
                        .font(.system(size: 8))
                        .foregroundColor(.white.opacity(0.7))
                }
                .padding(.horizontal, 16)
                
                // Like/dislike buttons
                HStack(spacing: 16) {
                    Button(action: {}) {
                        Image(systemName: "hand.thumbsup")
                            .foregroundColor(.blue)
                    }
                    
                    Button(action: {}) {
                        Image(systemName: "hand.thumbsdown")
                            .foregroundColor(.red)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 16)
                
                // User question
                Text("Could you give me another example of a sentence where the subject seems plural because of a prepositional phrase, but is actually singular?")
                    .font(.system(size: 9))
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.blue.opacity(0.7))
                    .cornerRadius(12)
                    .padding(.horizontal, 16)
                
                Text("9:41 AM")
                    .font(.system(size: 8))
                    .foregroundColor(.white.opacity(0.7))
                    .padding(.horizontal, 16)
                
                // Input area
                HStack {
                    Text("Send a message...")
                        .font(.system(size: 10))
                        .foregroundColor(.white.opacity(0.5))
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.blue)
                    }
                }
                .padding(8)
                .background(Color.white.opacity(0.1))
                .cornerRadius(20)
                .padding(.horizontal, 16)
                
                Spacer()
            }
            
            // AI Tutor arrow and label
            VStack {
                HStack {
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 4) {
                        Text("AI Tutor")
                            .font(.custom("Bradley Hand", size: 16))
                            .foregroundColor(.green)
                            .rotationEffect(.degrees(-5))
                        
                        Image(systemName: "arrow.down.left")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.green)
                            .rotationEffect(.degrees(-15))
                    }
                    .offset(x: 60, y: -80)
                }
                
                Spacer()
            }
        }
    }
}

struct PhoneMockupView3: View {
    var body: some View {
        ZStack {
            // Phone frame
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.black)
                .frame(width: 200, height: 400)
                .overlay(
                    RoundedRectangle(cornerRadius: 35)
                        .fill(Color.gray.opacity(0.1))
                        .frame(width: 180, height: 380)
                )
            
            // Screen content - Dashboard
            VStack(spacing: 8) {
                // Status bar
                HStack {
                    Text("9:41")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    HStack(spacing: 4) {
                        Image(systemName: "cellularbars")
                        Image(systemName: "wifi")
                        Image(systemName: "battery.100")
                    }
                    .font(.system(size: 10))
                    .foregroundColor(.white)
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                
                // Header
                HStack {
                    Text("Digital SAT Bootcamp")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(systemName: "gift")
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 16)
                
                Text("Week 1/10 - Your SAT is on August 24")
                    .font(.system(size: 10))
                    .foregroundColor(.white.opacity(0.7))
                    .padding(.horizontal, 16)
                
                // Total Score card
                VStack(spacing: 8) {
                    Text("Total Score")
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.7))
                    
                    HStack(alignment: .bottom, spacing: 4) {
                        Text("1250")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.green)
                        
                        VStack(alignment: .trailing) {
                            Text("You are in the 81st percentile")
                                .font(.system(size: 8))
                                .foregroundColor(.white.opacity(0.7))
                            
                            Text("📈 1400")
                                .font(.system(size: 10))
                                .foregroundColor(.green)
                        }
                    }
                    
                    // Progress bar
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color.green)
                        .frame(width: 120, height: 6)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white.opacity(0.1))
                )
                .padding(.horizontal, 16)
                
                // Reading & Writing and Math scores
                HStack(spacing: 8) {
                    VStack(spacing: 4) {
                        Text("Reading & Writing")
                            .font(.system(size: 10))
                            .foregroundColor(.white.opacity(0.7))
                        
                        Text("500")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.green)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white.opacity(0.1))
                    )
                    
                    VStack(spacing: 4) {
                        Text("Math")
                            .font(.system(size: 10))
                            .foregroundColor(.white.opacity(0.7))
                        
                        Text("750")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.green)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white.opacity(0.1))
                    )
                }
                .padding(.horizontal, 16)
                
                // Subject breakdown
                VStack(spacing: 8) {
                    Text("Reading & Writing")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                    
                    VStack(spacing: 6) {
                        SubjectRowView(title: "Information and Ideas", unit: "Unit 1", tests: 3, bestScore: 150, currentScore: "160/208")
                        SubjectRowView(title: "Craft and Structure", unit: "Unit 2", tests: 1, bestScore: 80, currentScore: "50/224")
                        SubjectRowView(title: "Expression of Ideas", unit: "Unit 3", tests: 8, bestScore: 160, currentScore: "140/160")
                    }
                }
                
                // Weekly time
                HStack {
                    Text("Weekly Time Spent")
                        .font(.system(size: 10))
                        .foregroundColor(.white.opacity(0.7))
                    
                    Spacer()
                    
                    Text("⏰ 3/4 hours")
                        .font(.system(size: 10))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 16)
                
                Spacer()
                
                // Bottom navigation
                HStack {
                    NavItemView(icon: "house", title: "Study", isSelected: true)
                    NavItemView(icon: "chart.bar", title: "Test Prep", isSelected: false)
                    NavItemView(icon: "bookmark", title: "Resources", isSelected: false)
                    NavItemView(icon: "message", title: "Coach", isSelected: false)
                    NavItemView(icon: "person", title: "Profile", isSelected: false)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            }
        }
    }
}

struct SubjectRowView: View {
    let title: String
    let unit: String
    let tests: Int
    let bestScore: Int
    let currentScore: String
    
    var body: some View {
        HStack(spacing: 8) {
            Circle()
                .fill(Color.green.opacity(0.3))
                .frame(width: 30, height: 30)
                .overlay(
                    Circle()
                        .stroke(Color.green, lineWidth: 2)
                )
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 10, weight: .medium))
                    .foregroundColor(.white)
                
                Text("\(unit) • Tests Taken: \(tests) • Best Score: \(bestScore)")
                    .font(.system(size: 8))
                    .foregroundColor(.white.opacity(0.7))
                
                Text("Score: \(currentScore)")
                    .font(.system(size: 8))
                    .foregroundColor(.green)
            }
            
            Spacer()
            
            Button(action: {}) {
                Image(systemName: "play.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 12))
            }
        }
        .padding(.horizontal, 16)
    }
}

struct NavItemView: View {
    let icon: String
    let title: String
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 2) {
            Image(systemName: icon)
                .font(.system(size: 14))
                .foregroundColor(isSelected ? .blue : .white.opacity(0.7))
            
            Text(title)
                .font(.system(size: 8))
                .foregroundColor(isSelected ? .blue : .white.opacity(0.7))
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    PurchaseFlowView(examType: .sat)
} 