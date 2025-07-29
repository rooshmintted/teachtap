import SwiftUI

struct TestPrepView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Test Prep Tab (Main Dashboard)
            DashboardView()
                .tabItem {
                    Image(systemName: "doc.text")
                    Text("Test Prep")
                }
                .tag(0)
            
            // Leaderboard Tab
            LeaderboardView()
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Leaderboard")
                }
                .tag(1)
            
            // Inbox Tab
            InboxView()
                .tabItem {
                    Image(systemName: "message")
                    Text("Inbox")
                }
                .tag(2)
            
            // Profile Tab
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(3)
        }
        .accentColor(.white)
        .onAppear {
            // Customize tab bar appearance
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.black
            
            // Selected item
            appearance.stackedLayoutAppearance.selected.iconColor = UIColor.white
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
            
            // Unselected item
            appearance.stackedLayoutAppearance.normal.iconColor = UIColor.gray
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
            
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

// MARK: - Dashboard View (Main Content)
struct DashboardView: View {
    var body: some View {
        ZStack {
            // Dark background with geometric pattern
            Color.black
                .overlay(
                    // Geometric pattern overlay
                    GeometricPatternView()
                        .opacity(0.3)
                )
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    // Header section
                    VStack(spacing: 12) {
                        // Digital SAT Bootcamp header
                        HStack {
                            Circle()
                                .fill(Color.teal)
                                .frame(width: 40, height: 40)
                                .overlay(
                                    Image(systemName: "calculator")
                                        .font(.system(size: 18))
                                        .foregroundColor(.white)
                                )
                            
                            Text("Digital SAT Bootcamp")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.white)
                            
                            Image(systemName: "chevron.down")
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                            
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                        
                        // Week and date info
                        Text("Week 1/10 (Jul 29 - Aug 1) - Your SAT is on October 4")
                            .font(.system(size: 14))
                            .foregroundColor(.white.opacity(0.8))
                            .padding(.horizontal, 20)
                    }
                    
                    // Total Score Card
                    TotalScoreCardView()
                        .padding(.horizontal, 20)
                    
                    // Subject Score Cards
                    HStack(spacing: 16) {
                        SubjectScoreCardView(
                            title: "Reading & Writing",
                            score: "550",
                            icon: "doc.text"
                        )
                        
                        SubjectScoreCardView(
                            title: "Math",
                            score: "550",
                            icon: "calculator"
                        )
                    }
                    .padding(.horizontal, 20)
                    
                    // Reading & Writing Section
                    ReadingWritingSectionView()
                        .padding(.horizontal, 20)
                    
                    // Weekly Time Spent
                    WeeklyTimeSpentView()
                        .padding(.horizontal, 20)
                        .padding(.bottom, 100) // Extra padding for tab bar
                }
            }
        }
    }
}

// MARK: - Total Score Card
struct TotalScoreCardView: View {
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: "doc.text")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                
                Text("Total Score")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.white)
                
                Spacer()
            }
            
            HStack(alignment: .bottom) {
                Text("1100")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(.green)
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    HStack {
                        Image(systemName: "target")
                            .font(.system(size: 12))
                            .foregroundColor(.green)
                        
                        Text("1480")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.green)
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.green.opacity(0.2))
                    )
                }
            }
            
            // Progress bar
            VStack(spacing: 8) {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.green)
                    .frame(height: 8)
                
                HStack {
                    Text("You are in the 61st percentile")
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.8))
                    
                    Spacer()
                }
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white.opacity(0.1), lineWidth: 1)
                )
        )
    }
}

// MARK: - Subject Score Card
struct SubjectScoreCardView: View {
    let title: String
    let score: String
    let icon: String
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                
                Text(title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                
                Spacer()
            }
            
            VStack(spacing: 12) {
                Text(score)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.green)
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.green)
                    .frame(height: 6)
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white.opacity(0.1), lineWidth: 1)
                )
        )
    }
}

// MARK: - Reading & Writing Section
struct ReadingWritingSectionView: View {
    let units = [
        UnitData(title: "Information and Ideas", unit: "Unit 1", baselineScore: "143/208"),
        UnitData(title: "Craft and Structure", unit: "Unit 2", baselineScore: "154/224"),
        UnitData(title: "Expression of Ideas", unit: "Unit 3", baselineScore: "110/160"),
        UnitData(title: "Standard English Conventions", unit: "Unit 4", baselineScore: "143/208")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Reading & Writing")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.white)
            
            VStack(spacing: 12) {
                ForEach(units.indices, id: \.self) { index in
                    UnitCardView(unit: units[index])
                }
            }
        }
    }
}

// MARK: - Unit Card
struct UnitCardView: View {
    let unit: UnitData
    
    var body: some View {
        HStack(spacing: 16) {
            // Circular progress indicator
            ZStack {
                Circle()
                    .stroke(Color.green.opacity(0.3), lineWidth: 3)
                    .frame(width: 40, height: 40)
                
                Circle()
                    .trim(from: 0, to: 0.3) // Partial progress
                    .stroke(Color.green, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                    .frame(width: 40, height: 40)
                    .rotationEffect(.degrees(-90))
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(unit.title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                
                HStack {
                    Text(unit.unit)
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.7))
                    
                    Text("| Last Score: -")
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.7))
                }
                
                Text("Baseline Score: \(unit.baselineScore)")
                    .font(.system(size: 14))
                    .foregroundColor(.green)
            }
            
            Spacer()
            
            Button(action: {
                print("DEBUG: Test 1 button tapped for \(unit.title)")
            }) {
                HStack(spacing: 8) {
                    Image(systemName: "play.fill")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                    
                    Text("Test 1")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white.opacity(0.1))
                )
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white.opacity(0.1), lineWidth: 1)
                )
        )
    }
}

// MARK: - Weekly Time Spent
struct WeeklyTimeSpentView: View {
    var body: some View {
        HStack {
            Text("Weekly Time Spent")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.teal)
            
            Spacer()
            
            HStack(spacing: 8) {
                ZStack {
                    Circle()
                        .stroke(Color.white.opacity(0.3), lineWidth: 2)
                        .frame(width: 24, height: 24)
                    
                    // No progress shown (0 hours)
                }
                
                Text("0/8 hours")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
            }
        }
    }
}

// MARK: - Data Models
struct UnitData {
    let title: String
    let unit: String
    let baselineScore: String
}

// MARK: - Geometric Pattern View
struct GeometricPatternView: View {
    var body: some View {
        Canvas { context, size in
            let path = Path { path in
                // Create geometric lines pattern
                for i in stride(from: 0, to: size.width, by: 50) {
                    path.move(to: CGPoint(x: i, y: 0))
                    path.addLine(to: CGPoint(x: i + 100, y: size.height))
                }
                
                for i in stride(from: 0, to: size.height, by: 50) {
                    path.move(to: CGPoint(x: 0, y: i))
                    path.addLine(to: CGPoint(x: size.width, y: i + 100))
                }
            }
            
            context.stroke(path, with: .color(.teal.opacity(0.1)), style: StrokeStyle(lineWidth: 1))
        }
    }
}

// MARK: - Placeholder Views for Other Tabs
struct LeaderboardView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                Text("Leaderboard")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                
                Text("Coming Soon")
                    .font(.system(size: 16))
                    .foregroundColor(.white.opacity(0.7))
            }
        }
    }
}

struct InboxView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                Text("Inbox")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                
                Text("Coming Soon")
                    .font(.system(size: 16))
                    .foregroundColor(.white.opacity(0.7))
            }
        }
    }
}

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                Text("Profile")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                
                Text("Coming Soon")
                    .font(.system(size: 16))
                    .foregroundColor(.white.opacity(0.7))
            }
        }
    }
}

#Preview {
    TestPrepView()
} 