import Foundation

struct TeamMate: Codable, Identifiable {
    var id: Int { playerInfo.uid }
    let playerInfo: PlayerInfo
    let matches: Int
    let wins: Int
    let winRate: String
    
    private enum CodingKeys: String, CodingKey {
        case matches, wins
        case playerInfo = "player_info"
        case winRate = "win_rate"
    }
    
    struct PlayerInfo: Codable {
        let nickname: String
        let playerIcon: String
        let uid: Int
        
        private enum CodingKeys: String, CodingKey {
            case nickname = "nick_name"
            case playerIcon = "player_icon"
            case uid = "player_uid"
        }
    }
}
