import Foundation

struct Map: Codable, Identifiable {
    
    let id: Int
    let name: String
    let fullName: String
    let location: String
    let description: String?
    let gameMode: String
    let isCompetitive: Bool
    let subMap: SubMap
    let images: [String]
    let video: String?
    
    private enum CodingKeys: String, CodingKey {
        case id, name, location, images, description, video
        case fullName = "full_name"
        case gameMode = "game_mode"
        case isCompetitive = "is_competitve"
        case subMap = "sub_map"
    }
}

extension Map: Hashable {
    static func ==(lhs: Map, rhs: Map) -> Bool {
           lhs.name == rhs.name
        && lhs.fullName == rhs.fullName
        && lhs.location == rhs.location
        && lhs.description == rhs.description
        && lhs.gameMode == rhs.gameMode
        && lhs.video == rhs.video
        && lhs.subMap == rhs.subMap
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(fullName)
        hasher.combine(location)
        hasher.combine(description)
        hasher.combine(gameMode)
        hasher.combine(video)
        hasher.combine(subMap)
    }
}


struct MapResponse: Codable {
    let totalMaps: Int
    let maps: [Map]
    
    private enum CodingKeys: String, CodingKey {
        case maps
        case totalMaps = "total_maps"
    }
}

extension Map {
    static let test: Map = .init(
        id: 1101,
        name: "Hall of Djalia",
        fullName: "Hall of Djalia - Intergalactic Empire of Wakanda",
        location: "Intergalactic Empire of Wakanda",
        description: nil,
        gameMode: "Convergence",
        isCompetitive: false,
        subMap: .init(id: 1035, name: nil, thumbnail: nil),
        images: [
            "/rivals/maps/map_1101.png",
            "/rivals/maps/medium/map_1101.png",
            "/rivals/maps/large/map_1101.png"
        ],
        video: "https://youtu.be/dz_778SYulo"
        
    )
}

struct SubMap: Codable, Hashable {
    let id: Int?
    let name: String?
    let thumbnail: String?
}

struct MapRequestResponse: Codable {
    let totalMaps: Int
    let maps: [Map]
}
