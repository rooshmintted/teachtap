import SwiftUI

struct ProfileSetupView: View {
    @State private var username = "roosh7893"
    @State private var showTestPrepView = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            // Dark teal background matching purchase flow
            LinearGradient(
                gradient: Gradient(colors: [Color(red: 0.15, green: 0.45, blue: 0.55), Color(red: 0.1, green: 0.35, blue: 0.45)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: 60)
                
                // Title
                Text("One Last Step!")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Spacer()
                    .frame(height: 24)
                
                // Description text
                Text("Before you start, set up your profile. Your username and photo will be displayed publicly on places like the leaderboard. You can change this at any time from your profile.")
                    .font(.system(size: 16))
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                
                Spacer()
                    .frame(height: 60)
                
                // Profile photo section
                VStack(spacing: 16) {
                    // Profile photo placeholder with "R"
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.yellow, Color.green]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 120, height: 120)
                        
                        Text("R")
                            .font(.system(size: 48, weight: .bold))
                            .foregroundColor(.white)
                    }
                    
                    // Change photo button
                    Button(action: {
                        print("DEBUG: Change photo button tapped")
                        // Handle photo change action
                    }) {
                        Text("Change photo")
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                    }
                }
                
                Spacer()
                    .frame(height: 80)
                
                // Username section
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Username")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                        
                        Text("*")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 40)
                    
                    // Username text field
                    TextField("", text: $username)
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.clear)
                                )
                        )
                        .padding(.horizontal, 40)
                        .onChange(of: username) { _, newValue in
                            print("DEBUG: Username changed to: \(newValue)")
                        }
                    
                    // Username validation text
                    Text("The username must be between 6 and 20 characters and can only contain letters and numbers.")
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.7))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 40)
                }
                
                Spacer()
                
                // Save & Get Started button
                Button(action: {
                    print("DEBUG: Save & Get Started button tapped with username: \(username)")
                    // Navigate to main test prep dashboard
                    showTestPrepView = true
                }) {
                    Text("Save & Get Started")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.green)
                        )
                }
                .padding(.horizontal, 40)
                
                Spacer()
                    .frame(height: 40)
            }
        }
        .navigationBarHidden(true)
        .fullScreenCover(isPresented: $showTestPrepView) {
            TestPrepView()
        }
    }
}

#Preview {
    ProfileSetupView()
} 