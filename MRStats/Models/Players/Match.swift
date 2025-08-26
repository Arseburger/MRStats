import Foundation

struct Match: Codable, Identifiable {
    var id: String { matchUid }
    
    let matchUid: String
    let mapId: Int?
    let mapThumbnail: String?
    let duration: Double?
    let season: Int?
    let winnerSide: Int?
    let mvpUid: Int?
    let svpUid: Int?
    let matchTimeStamp: Int?
    let playModeId: Int?
    let gameModeId: Int?
    let scoreInfo: MatchScore?
    let performance: PlayerPerformance?
    
    private enum CodingKeys: String, CodingKey {
        case duration, season
        case matchUid = "match_uid"
        case mapId = "map_id"
        case mapThumbnail = "map_thumbnail"
        case winnerSide = "winner_side"
        case mvpUid = "mvp_uid"
        case svpUid = "svp_uid"
        case matchTimeStamp = "match_time_stamp"
        case playModeId = "play_mode_id"
        case gameModeId = "game_mode_id"
        case scoreInfo = "score_info"
        case performance = "player_performance"
    }
    
    struct MatchScore: Codable {
        let red: Int?
        let blue: Int?
        
        private enum CodingKeys: String, CodingKey {
            case red = "0"
            case blue = "1"
        }
    }
    
    struct PlayerPerformance: Codable {
        let playerUid: Int
        let heroId: Int?
        let heroName: String?
        let heroType: String?
        let kills: Int?
        let deaths: Int?
        let assists: Int?
        let isWin: IsWin?
        let disconnected: Bool?
        let camp: Int?
        let scoreChange: Double?
        let level: Int?
        let newLevel: Int?
        let newScore: Double?
        
        private enum CodingKeys: String, CodingKey {
            case kills, deaths, assists, disconnected, camp, level
            case playerUid = "player_uid"
            case heroId = "hero_id"
            case heroName = "hero_name"
            case heroType = "hero_type"
            case isWin = "is_win"
            case scoreChange = "score_change"
            case newLevel = "new_level"
            case newScore = "new_score"
        }
        
        struct IsWin: Codable {
            let score: Int?
            let isWin: Bool?
            
            private enum CodingKeys: String, CodingKey {
                case score
                case isWin = "is_win"
            }
        }
    }
}
