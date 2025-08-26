import SwiftUI

struct Hero: Codable, Hashable, Identifiable {
    
    let id: String
    let name: String
    let realName: String
    let imageUrl: String
    let role: Role
    let attackType: String
    let team: [String]
    let difficulty: String
    let bio: String
    let lore: String
    let transformations: [Transformation]
    let costumes: [Costume]?
    let abilities: [Ability]
    
    private enum CodingKeys: String, CodingKey {
        case id, name, imageUrl, role, team, difficulty, bio, lore, transformations, costumes, abilities
        case realName = "real_name"
        case attackType = "attack_type"
    }
}

extension Hero {
    func teamsString() -> String {
        team.map { $0 }.joined(separator: ", ")
    }
    
    var iconURL: String {
        if !transformations.isEmpty {
            return transformations.first!.icon
        } else {
            return imageUrl
        }
    }
}

//extension Hero {
//    static let empty = Hero.init(id: "", name: "", realName: "", imageUrl: "", role: .duelist, attackType: "", team: [], difficulty: "", bio: "", lore: "", transformations: [], costumes: [], abilities: [])
//    
//    static let test = Hero.init(
//        id: "1011",
//        name: "hulk",
//        realName: "Bruce Banner",
//        imageUrl: "/rivals/heroes/card/hulk.png",
//        role: Role(rawValue: "Vanguard") ?? .vanguard,
//        attackType: "Melee Heroes",
//        team: [
//            "Avengers"
//        ],
//        difficulty: "4",
//        bio: "Brilliant scientist Dr. Bruce Banner has finally found a way to coexist with his monstrous alter ego, the Hulk. By accumulating gamma energy over transformations, he can become a wise and strong Hero Hulk or a fierce and destructive Monster Hulk – a true force of fury on the battlefield!",
//        lore: "Caught in the detonation of a powerful weapon of his own invention, Dr. Bruce Banner absorbed gamma radiation that transforms him into a massive green monster whenever his emotions rage out of control. As Banner, he's still a genius. But as the Hulk, he's the strongest one there is!\nBanner developed a special Gamma Belt to control his transformations and temper the Hulk's fury. But when the Timestream Entanglement transformed Los Diablos Missile Base into a demonic battleground, he realized that the best way to fight monsters was to let out the one within.",
//        transformations: [.test],
//        costumes: [.test],
//        abilities: [.test]
//    )
//    
//}

