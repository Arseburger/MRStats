import Foundation
struct Team: Codable, Hashable {
    let clubTeamId: String?
    let clubTeamMiniName: String?
    let clubTeamType: String?
    
    private enum CodingKeys: String, CodingKey {
        case clubTeamId = "club_team_id"
        case clubTeamMiniName = "club_team_mini_name"
        case clubTeamType = "club_team_type"
    }
}
