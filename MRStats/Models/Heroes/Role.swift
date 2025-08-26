import SwiftUI

enum Role: String, Codable, CaseIterable {
    case strategist = "Strategist"
    case duelist = "Duelist"
    case vanguard = "Vanguard"
    case unknown = "Unknown"
    
    static func < (lhs: Role, rhs: Role) -> Bool {
        switch (lhs, rhs) {
        case (.vanguard, _): return true
        case (.duelist, .strategist): return true
        case (.strategist, _): return false
        case (.duelist, .vanguard): return false
        case (.duelist, .duelist): return false
        case (_, .unknown): return false
        case (.unknown, _): return true
        }
    }
    
    init?(rawValue: String) {
        switch rawValue {
        case "Strategist": self = .strategist
        case "Duelist": self = .duelist
        case "Vanguard": self = .vanguard
        default: self = .unknown
        }
    }
    
    var color: Color {
        switch self {
        case .vanguard: return .blue
        case .duelist: return .red
        case .strategist: return .green
        case .unknown: return .gray
        }
    }
}

