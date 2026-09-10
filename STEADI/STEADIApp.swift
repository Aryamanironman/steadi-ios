import SwiftUI

@main
struct STEADIApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                TodayView()
                    .tabItem { Label("Today", systemImage: "sun.max.fill") }
                FamilyView()
                    .tabItem { Label("Family", systemImage: "heart.fill") }
                ReportView()
                    .tabItem { Label("Report", systemImage: "doc.text.fill") }
            }
            .tint(Color.lime)
            .preferredColorScheme(.light)
        }
    }
}
