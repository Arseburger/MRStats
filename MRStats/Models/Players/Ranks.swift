import SwiftUI

enum Ranks: Identifiable, CaseIterable {
    static var allCases: [Ranks] = [.bronze(3), .silver(3), .gold(3), .platinum(3), .diamond(3), .grandmaster(3), .celestial(3), .eternity, .oneAboveAll]
    
    var id : Int { level }
    
    case bronze(Int)
    case silver(Int)
    case gold(Int)
    case platinum(Int)
    case diamond(Int)
    case grandmaster(Int)
    case celestial(Int)
    case eternity
    case oneAboveAll
    
    init(_ level: Int) {
        switch level {
        case 1...3: self = .bronze(4 - level)
        case 4...6: self = .silver(7 - level)
        case 7...9: self = .gold(10 - level)
        case 10...12: self = .platinum(13 - level)
        case 13...15: self = .diamond(16 - level)
        case 16...18: self = .grandmaster(19 - level)
        case 19...21: self = .celestial(22 - level)
        case 22: self = .eternity
        case 23: self = .oneAboveAll
        default: self = .bronze(3)
        }
    }
    
    var level: Int {
        switch self {
        case .bronze(let lvl): return 4 - lvl
        case .silver(let lvl): return 7 - lvl
        case .gold(let lvl): return 10 - lvl
        case .platinum(let lvl): return 13 - lvl
        case .diamond(let lvl): return 16 - lvl
        case .grandmaster(let lvl): return 19 - lvl
        case .celestial(let lvl): return 22 - lvl
        case .eternity: return 22
        case .oneAboveAll: return 23
        }
    }
    
    var color: Color {
        switch self {
        case .bronze: return .init(hex: "A7693F")
        case .silver: return .init(hex: "7B9196")
        case .gold: return .init(hex: "#FFDA57")
        case .platinum: return .init(hex: "#58E1E8")
        case .diamond: return .init(hex: "B5F7FF")
        case .grandmaster: return .init(hex: "#EB46FF")
        case .celestial: return .init(hex: "#FE5A1D")
        case .eternity: return .init(hex: "E282F7")
        case .oneAboveAll: return .init(hex: "#FF4F4D")
        }
    }
    
    var image: String {
        var stringRank: String = ""
        
        switch self {
        case .bronze: stringRank = "bronze"
        case .silver: stringRank = "silver"
        case .gold: stringRank = "gold"
        case .platinum: stringRank = "platinum"
        case .diamond: stringRank = "diamond"
        case .grandmaster: stringRank = "grandmaster"
        case .celestial: stringRank = "celestial"
        case .eternity: stringRank = "eternity"
        case .oneAboveAll: stringRank = "one_above_all"
        }
        
        return "/ranked/\(stringRank).png"
    }
    
    var rankString: String {
        switch self {
        case .bronze(let lvl): return "Bronze \(String.init(repeating: "I", count: lvl))"
        case .silver(let lvl): return "Silver \(String.init(repeating: "I", count: lvl))"
        case .gold(let lvl): return "Gold \(String.init(repeating: "I", count: lvl))"
        case .platinum(let lvl): return "Platinum \(String.init(repeating: "I", count: lvl))"
        case .diamond(let lvl): return "Diamond \(String.init(repeating: "I", count: lvl))"
        case .grandmaster(let lvl): return "Grandmaster \(String.init(repeating: "I", count: lvl))"
        case .celestial(let lvl): return "Celestial \(String.init(repeating: "I", count: lvl))"
        case .eternity: return "Eternity"
        case .oneAboveAll: return "One Above All"
        }
    }
    
    static func > (lhs: Ranks, rhs: Ranks) -> Bool {
        lhs.level > rhs.level
    }
}
