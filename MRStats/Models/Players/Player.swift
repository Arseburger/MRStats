import Foundation

struct Player: Codable, Identifiable {
    let id: Int
    let level: String?
    let name: String?
    let icon: PlayerIcon?
    let rank: Rank?
    let team: Team?
    let info: Info?
    
    private enum CodingKeys: String, CodingKey {
        case level, name, icon, rank, team, info
        case id = "uid"
    }
}

struct PlayerResponse: Codable {
    let uid: Int?
    let name: String?
    let updates: Update?
    let player: Player?
    let isPrivate: Bool?
    let overallStats: OverallStats?
    let matchHistory: [Match]?
    let rankHistory: [RankStage]?
    let heroMatchups: [HeroMatchup]?
    let teamMates: [TeamMate]?
    let maps: [MapStats]?
    
    private enum CodingKeys: String, CodingKey {
        case uid, name, updates, player, isPrivate, maps
        case overallStats = "overall_stats"
        case matchHistory = "match_history"
        case rankHistory = "rank_history"
        case heroMatchups = "hero_matchups"
        case teamMates = "team_mates"
    }
}

extension PlayerResponse: Equatable {
    static func == (lhs: PlayerResponse, rhs: PlayerResponse) -> Bool {
        return lhs.updates?.lastUpdateRequest == rhs.updates?.lastUpdateRequest && lhs.uid == rhs.uid
    }
    
    static let empty: PlayerResponse = .init(uid: -1, name: "No Player", updates: .init(infoUpdateTime: "", lastHistoryUpdate: "", lastInsertedMatch: "", lastUpdateRequest: ""), player: .init(id: -1, level: "", name: "No Player", icon: .init(playerIconId: "", playerIcon: ""), rank: .init(rank: "", image: "", color: ""), team: .init(clubTeamId: "", clubTeamMiniName: "", clubTeamType: ""), info: .init(completedAchievements: "", loginOS: "", rankGameSeason: [:])), isPrivate: false, overallStats: .init(totalMatches: 0, totalWins: 0, unranked: .init(totalMatches: 0, totalWins: 0, totalAssists: 0, totalDeaths: 0, totalKills: 0, totalTimePlayed: "", totalTimePlayedRaw: 0.0, totalMvp: 0, totalSvp: 0), ranked: .init(totalMatches: 0, totalWins: 0, totalAssists: 0, totalDeaths: 0, totalKills: 0, totalTimePlayed: "", totalTimePlayedRaw: 0.0, totalMvp: 0, totalSvp: 0)), matchHistory: [], rankHistory: [], heroMatchups: [], teamMates: [], maps: [])
}
