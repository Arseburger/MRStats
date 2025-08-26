import SwiftUI

enum SideButtonImage: String {
    case filter = "arrow.up.arrow.down"
    case clear = "trash.circle"
}

struct SideButton: View {
    @Binding var shouldExpand: Bool
    var image: SideButtonImage
    var action: () -> Void = { }
    
    var body: some View {
        Button { action() }
        label: {
            Image(systemName: image.rawValue)
                .resizable()
                .padding(8)
                .frame(width: 40, height: 40)
                .transition(.scale(scale: 1.0))
        }
    }
}
