import Foundation

enum Sorting: Int, CaseIterable {
    case none = 1
    case name = 2
    case role = 3
    
    init(rawValue: Int) {
        switch rawValue {
        case 1: self = .none
        case 2: self = .name
        case 3: self = .role
        default: self = .none
        }
    }
    
    var title: String {
        switch self {
        case .none: return "Default"
        case .name: return "Name"
        case .role: return "Role"
        }
    }
    
    var rule: ((Hero, Hero) -> Bool) {
        switch self {
        case .none:
            return { lhs, rhs in return lhs.id < rhs.id }
        case .name:
            return { lhs, rhs in return lhs.name < rhs.name }
        case .role:
            return { lhs, rhs in return lhs.role < rhs.role }
        }
    }
}
