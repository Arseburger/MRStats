import Foundation

struct RankStage: Codable, Identifiable {
    var id: Int { matchTimeStamp }
    let matchTimeStamp: Int
    let levelProgression: LevelProgression
    let scoreProgression: ScoreProgression
    var date: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM"
        return formatter.string(for: Date(timeIntervalSince1970: TimeInterval(matchTimeStamp)))!
        
    }
    static func < (lhs: RankStage, rhs: RankStage) -> Bool {
        return lhs.levelProgression.to <= rhs.levelProgression.to
    }
    
    private enum CodingKeys: String, CodingKey {
        case matchTimeStamp = "match_time_stamp"
        case levelProgression = "level_progression"
        case scoreProgression = "score_progression"
    }
    
    struct LevelProgression: Codable {
        let `from`: Int
        let to: Int
    }

    struct ScoreProgression: Codable {
        let addScore: Double
        let totalScore: Double
        
        private enum CodingKeys: String, CodingKey {
            case addScore = "add_score"
            case totalScore = "total_score"
        }
    }
}
