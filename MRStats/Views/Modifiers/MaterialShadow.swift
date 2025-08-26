import SwiftUI

struct materialShadow: ViewModifier {
    var radius: CGFloat = 16
    
    func body(content: Content) -> some View {
        content
            .background {
                RoundedRectangle(cornerRadius: radius)
                    .fill(.mrDarkBlue)
                    .shadow(
                        color: .white.opacity(0.4),
                        radius: 4, x: 0, y: 0
                    )
                    .blur(radius: 1)
            }
    }
}
