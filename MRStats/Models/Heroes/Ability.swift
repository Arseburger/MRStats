import SwiftUI

struct Ability: Codable, Hashable, Identifiable {
    let id: Int
    let icon: String?
    let name: String?
    let type: AbilityType?
    let isCollab: Bool?
    let description: String?
    let additionalFields: [String: String?]?
    let transformationId: String?
    
    private enum CodingKeys: String, CodingKey {
        case id, icon, name, type, isCollab, description
        case additionalFields = "additional_fields"
        case transformationId = "transformation_id"
    }
}

enum AbilityType: String, Codable {
    case ultimate = "Ultimate"
    case weapon = "Weapon"
    case normal = "Normal"
    case passive = "Passive"
    case movement = "Movement"
    
    init?(rawValue: String) {
        switch rawValue {
        case "Ultimate": self = .ultimate
        case "Weapon": self = .weapon
        case "Normal": self = .normal
        case "Passive": self = .passive
        case "Movement": self = .movement
        default: return nil
        }
    }
    
    func getColor() -> Color {
        switch self {
        case .ultimate: return .orange
        case .weapon: return .white
        case .normal: return .blue
        case .passive: return .gray
        case .movement: return .mint
        }
    }
    
    var value: Int {
        switch self {
        case .ultimate: return 4
        case .normal: return 3
        case .weapon: return 2
        case .movement: return 1
        case .passive: return 0
        }
    }
}
