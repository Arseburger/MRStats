import SwiftUI

enum Quality: String, Codable, CaseIterable {
    case common = "WHITE"
    case rare = "BLUE"
    case epic = "PURPLE"
    case legendary = "ORANGE"
    
    init?(rawValue: String) {
        switch rawValue {
        case "WHITE": self = .common
        case "BLUE": self = .rare
        case "PURPLE": self = .epic
        case "ORANGE": self = .legendary
        default: self = .common
        }
    }
    
    var color: Color {
        switch self {
        case .common: .white
        case .rare: .blue
        case .epic: .purple
        case .legendary: .orange
        }
    }
}
