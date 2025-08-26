import SwiftUI

struct MRShadow: ViewModifier {
    var shadowColor: Color = .red
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .padding(4)
            .background {
                RoundedRectangle(cornerRadius: 8)
                
            }
            .shadow(color: shadowColor, radius: 30)
    }
}
