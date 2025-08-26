import Foundation

struct Info: Codable {
    let completedAchievements: String
    let loginOS: String
    let rankGameSeason: [String: Season]
    
    private enum CodingKeys: String, CodingKey {
        case completedAchievements = "completed_achievements"
        case loginOS = "login_os"
        case rankGameSeason = "rank_game_season"
    }
    
    struct Season: Codable {
        let rankGameId: Int
        let level: Int
        let rankScore: Double
        let maxLevel: Int
        let maxRankScore: Double
        let updateTime: Int
        let winCount: Int
        let protectScore: Int
        let diffScore: Double
        
        private enum CodingKeys: String, CodingKey {
            case level = "level"
            case rankGameId = "rank_game_id"
            case rankScore = "rank_score"
            case maxLevel = "max_level"
            case maxRankScore = "max_rank_score"
            case updateTime = "update_time"
            case winCount = "win_count"
            case protectScore = "protect_score"
            case diffScore = "diff_score"
        }
    }
}
