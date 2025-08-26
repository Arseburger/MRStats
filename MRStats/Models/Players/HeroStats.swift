import Foundation

struct HeroStats: Codable, Identifiable {
    var id: Int { heroId }
    
    let heroId: Int
    let heroName: String
    let heroThumbnail: String
    let matches: Int
    let wins: Int
    let mvp: Int
    let svp: Int
    let kills: Int
    let deaths: Int
    let assists: Int
    let playTime: Double
    let damage: Double
    let heal: Int
    let damageTaken: Double
    let mainAttack: MainAttack
    
    var accuracy: Double {
        Double(mainAttack.hits / mainAttack.total)
    }
    
    private enum CodingKeys: String, CodingKey {
        case matches, wins, mvp, svp, kills, deaths, assists, damage, heal
        case heroId = "hero_id"
        case heroName = "hero_name"
        case heroThumbnail = "hero_thumbnail"
        case playTime = "play_time"
        case damageTaken = "damage_taken"
        case mainAttack = "main_attack"
    }
    
    struct MainAttack: Codable {
        let total: Int
        let hits: Int
    }
}
