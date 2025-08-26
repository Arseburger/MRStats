import SwiftUI

protocol MRViewModel: AnyObject, BannerDelegate {
    var banner: Banner? { get set }
}

extension MRViewModel {
    private weak var bannerManager: BannerManager? {
        DI.shared.bannerManager
    }
    
    func disableBanner(_ time: Double = 1.5) {
        guard banner != nil else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + time) { [weak self] in
            withAnimation(.smooth) {
                self?.banner = nil
            }
        }
    }
}
