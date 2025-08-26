import SwiftUI

struct Rank: Codable {
    let rank: String?
    let image: String?
    let color: String?
    
    func getColor() -> Color? {
        guard let color else {
            return nil
        }
        return Color(hex: color)
    }
}
