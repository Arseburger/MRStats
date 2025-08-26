import SwiftUI

enum CustomFonts: String {
    case main = "Boogaloo"
    
    static func getFont(_ font: CustomFonts = .main, size: CGFloat = 16.0) -> Font {
        return .custom(font.rawValue, size: size)
    }
}
