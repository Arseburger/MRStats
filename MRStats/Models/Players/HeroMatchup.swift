import Foundation

struct HeroMatchup: Codable, Hashable, Identifiable {
    var id: Int { heroId ?? Int.random(in: 5000...6000) }
    let heroId: Int?
    let heroName: String?
    let heroClass: Role?
    let heroThumbnail: String?
    let matches: Int?
    let wins: Int?
    let winRate: String?
    
    init?(heroId: Int?, heroName: String, heroClass: Role, heroThumbnail: String, matches: Int, wins: Int, winRate: String) {
        if let heroId {
            self.heroId = heroId
            self.heroName = heroName
            self.heroClass = heroClass
            self.heroThumbnail = heroThumbnail
            self.matches = matches
            self.wins = wins
            self.winRate = winRate
        } else {
            return nil
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case heroId = "hero_id"
        case heroName = "hero_name"
        case heroClass = "hero_class"
        case heroThumbnail = "hero_thumbnail"
        case matches = "matches"
        case wins = "wins"
        case winRate = "win_rate"
    } 
}
