import SwiftUI

enum ImageType: String {
    case hero
    case map
}

struct RemoteImage: View {
    var image: Image?
    var type: ImageType? = .hero
    var body: some View {
        image?.resizable() ?? Image(type == .hero
                                    ? .placeholderHero
                                    : .placeholderMap
                            ).resizable()
    }
}

struct MRImage: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    let type: ImageType
    
    var body: some View {
        RemoteImage(image: imageLoader.image, type: type)
            .onAppear {
                imageLoader.load(
                    from: type == .map
                    ? String(urlString.dropFirst(7))
                    : urlString
                )
            }
            .onChange(of: urlString) { _, newUrl in
                imageLoader.load(from: newUrl)
            }
    }
    
    init(urlString: String, type: ImageType = .hero) {
        self.urlString = urlString
        self.type = type
    }
}
