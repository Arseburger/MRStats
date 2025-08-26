import SwiftUI

struct mrStyle: ViewModifier {
    var width: CGFloat = 160.0
    var height: CGFloat = 40.0
    var fontSize: CGFloat = 16.0
    
    func body(content: Content) -> some View {
        content
            .font(CustomFonts.getFont(size: fontSize))
            .padding(4)
            .foregroundStyle(.mrYellow)
            .frame(maxWidth: .infinity, idealHeight: height)
            .background(.mrDarkBlue)
            .cornerRadius(16)
    }
}
