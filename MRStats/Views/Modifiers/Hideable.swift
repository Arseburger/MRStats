import SwiftUI

struct hideableToolbar: ViewModifier {
    @Binding var shouldHide: Bool
    
    func body(content: Content) -> some View {
        content
            .toolbarVisibility(shouldHide ? .hidden : .visible, for: .navigationBar)
            .blur(radius: shouldHide ? 20 : 0)
            .disabled(shouldHide)
    }
}
