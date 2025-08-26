import SwiftUI

struct emptyState: ViewModifier {
    var condition: Bool
    
    func body(content: Content) -> some View {
        content
            .overlay {
                if condition {
                    ContentUnavailableView(
                        "Your search history is empty.",
                        systemImage: "person.crop.badge.magnifyingglass",
                        description: Text("Try finding some players!")
                    )
                    .font(.title3)
                    .foregroundStyle(.white.opacity(0.5))
                    .offset(y: -50)
                }
            }
    }
}
