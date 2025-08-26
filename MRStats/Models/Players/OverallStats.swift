import Foundation

struct OverallStats: Codable {
    let totalMatches: Int
    let totalWins: Int
    let unranked: MatchStats
    let ranked: MatchStats
    
    private enum CodingKeys: String, CodingKey {
        case unranked, ranked
        case totalMatches = "total_matches"
        case totalWins = "total_wins"
    }
    
    struct MatchStats: Codable {
        let totalMatches: Int
        let totalWins: Int
        let totalAssists: Int
        let totalDeaths: Int
        let totalKills: Int
        let totalTimePlayed: String
        let totalTimePlayedRaw: Double
        let totalMvp: Int
        let totalSvp: Int
        
        private enum CodingKeys: String, CodingKey {
            case totalMatches = "total_matches"
            case totalWins = "total_wins"
            case totalAssists = "total_assists"
            case totalDeaths = "total_deaths"
            case totalKills = "total_kills"
            case totalTimePlayed = "total_time_played"
            case totalTimePlayedRaw = "total_time_played_raw"
            case totalMvp = "total_mvp"
            case totalSvp = "total_svp"
        }
    }
}

extension OverallStats {
    func gameMode(for gamemode: GameMode) -> OverallStats.MatchStats? {
        gamemode == .ranked ? self.ranked : self.unranked
    }
}

enum GameMode: String {
    case ranked = "Ranked"
    case unranked = "Unranked"
}
