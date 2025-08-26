import Foundation

struct PlayerIcon: Codable {
    let playerIconId: String?
    let playerIcon: String?
    
    private enum CodingKeys: String, CodingKey {
        case playerIconId = "player_icon_id"
        case playerIcon = "player_icon"
    }
}
