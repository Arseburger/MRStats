import SwiftUI
import UIKit

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(from stringUrl: String) {
        NetworkManager.shared.downloadImage(from: stringUrl) { uiImage in
            guard let uiImage else { return }
            DispatchQueue.main.async { [weak self] in
                self?.image = Image(uiImage: uiImage)
            }
        }
    }
}


