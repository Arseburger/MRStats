import Foundation

struct Update: Codable {
    let infoUpdateTime: String?
    let lastHistoryUpdate: String?
    let lastInsertedMatch: String?
    let lastUpdateRequest: String?
    
    private enum CodingKeys: String, CodingKey {
        case infoUpdateTime = "info_update_time"
        case lastHistoryUpdate = "last_history_update"
        case lastInsertedMatch = "last_inserted_match"
        case lastUpdateRequest = "last_update_request"
    }
}

struct UpdateStatus: Codable {
    let success: Bool?
    let error: Bool?
    let message: String?
    let status: Int?
}
