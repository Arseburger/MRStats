import Foundation

struct SearchQuery: Codable, Identifiable {
    
    var id: String?
    let name: String?
    var error: Bool?
    var message: String?
    var status: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "uid"
        case name, error, message, status
    }
}

extension SearchQuery: Equatable {
    static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id && lhs.name == rhs.name
    }
}
