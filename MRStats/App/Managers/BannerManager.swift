import SwiftUI

protocol BannerDelegate: AnyObject {
    var banner: Banner? { get }
}

enum BannerType {
    case info
    case success
    case failure
    
    func color() -> Color {
        switch self {
        case .info:
            return .blue
        case .success:
            return .green
        case .failure:
            return .red
        }
    }
}

final class BannerManager: ObservableObject {
    @ViewBuilder func banner(_ banner: Banner, ofType type: BannerType) -> some View {
        MRBanner(banner: banner, type: type)
    }
}
