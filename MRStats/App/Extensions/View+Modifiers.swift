import SwiftUI

extension View {
    func emptyStated(_ condition: Bool) -> some View {
        modifier(emptyState(condition: condition))
    }
    
    func materialShadowed(radius: CGFloat = 16) -> some View {
        modifier(materialShadow(radius: radius))
    }
    
    func itemBordered(color: Color, radius: CGFloat, width: CGFloat) -> some View {
        modifier(itemBorder(color: color, radius: radius, width: width))
    }
    
    func hideable(_ shouldHide: Binding<Bool>) -> some View {
        modifier(hideableToolbar(shouldHide: shouldHide))
    }
    
    func mrStyled(width: CGFloat = 160, height: CGFloat = 40, fontSize: CGFloat = 16) -> some View {
        modifier(mrStyle(width: width, height: height, fontSize: fontSize))
    }
}
