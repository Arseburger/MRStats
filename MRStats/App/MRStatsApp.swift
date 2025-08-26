import SwiftUI

@main
struct MRStatsApp: App {
    
    let bannerManager: BannerManager = DI.shared.bannerManager
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(.dark)
                .environmentObject(bannerManager)
        }
    }
}
