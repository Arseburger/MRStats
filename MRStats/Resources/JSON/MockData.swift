import SwiftUI

struct MockData {
    static let shared = MockData()
    let map: Map?
    let heroes: [Hero]?
    let player: Player?
    let player2: PlayerResponse?
    let sn15: PlayerResponse?
    
    init() {
        self.map = try? getFromJsonFile(fileName: "MockMap")
        self.heroes = try? getFromJsonFile(fileName: "MockHero")
        self.player = try? getFromJsonFile(fileName: "MockPlayer")
        self.player2 = try? getFromJsonFile(fileName: "NewPlayer")
        self.sn15 = try? getFromJsonFile(fileName: "SN15")
    }
}

func getFromJsonFile<T: Decodable>(fileName: String) throws -> T? {
    let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json")!
    guard let data = try? Data(contentsOf: fileURL) else {
        return nil
    }
    let decoder = JSONDecoder()
    return try decoder.decodeDetailed(T?.self, from: data)
}
