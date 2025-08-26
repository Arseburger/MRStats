import SwiftUI

struct Transformation: Codable, Hashable, Identifiable {
    let id: String
    let name: String?
    let icon: String
    let health: String?
    let movementSpeed: String?
    
    private enum CodingKeys: String, CodingKey {
        case id, name, icon, health
        case movementSpeed = "movement_speed"
    }
}
