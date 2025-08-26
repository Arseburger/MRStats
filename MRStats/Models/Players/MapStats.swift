import Foundation

struct MapStats: Codable, Hashable, Identifiable {
    var id: Int { mapId }
    let mapId: Int
    let thumbnail: String?
    let matches: Int
    let wins: Int
    let kills: Int
    let deaths: Int
    let assists: Int
    let playTime: Double
    
    var stringTime: String {
        let minutes = Int(playTime / 60)
        let seconds = Int(playTime.truncatingRemainder(dividingBy: 60))
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    private enum CodingKeys: String, CodingKey {
        case matches, wins, kills, deaths, assists
        case mapId = "map_id"
        case thumbnail = "map_thumbnail"
        case playTime = "play_time"
    }
}
