import Foundation

enum ApiClient {
    
    enum BaseUrl: String {
        case main = "https://marvelrivalsapi.com/api/v1"
        case source = "https://marvelrivalsapi.com/rivals"
    }
    
    enum Errors: String, Error {
        case tooManyRequests = "Too many requests hit the API too quickly."
        case badRequest = "Bad request structure or missing required parameters."
        case urlNotFound = "The URL the client requested does not exist on the server."
        case internalError = "Something went wrong on the server end."
        case unauthorized = "Invalid or missing API key."
        case unknownError = "Something went wrong."
        case gatewayTimeout  = "The web server reported a gateway time-out error. Try again later."
        
        init(_ code: Int) {
            switch code {
            case 400: self = .badRequest
            case 401: self = .unauthorized
            case 404: self = .urlNotFound
            case 429: self = .tooManyRequests
            case 504: self = .gatewayTimeout
            case 500 ..< 600: self = .internalError
            default: self = .unknownError
            }
        }
    }
    
    enum Endpoints {
        case image(Bool)
        case heroes
        case maps(Int?)
        case findPlayer(String)
        case loadPlayer(String, String)
        case updatePlayer(String)
        
        func url() -> String {
            switch self {
            case .image(let clean):
                return "\(BaseUrl.source.rawValue)/\(clean ? "/" : "resources/")"
            case .heroes:
                return "\(BaseUrl.main.rawValue)/heroes"
            case .maps(let limit):
                return "\(BaseUrl.main.rawValue)/maps\(limit != nil ? "?limit=\(limit!)":"")"
            case .findPlayer(let name):
                return "\(BaseUrl.main.rawValue)/find-player/\(name)"
            case .loadPlayer(let id, let season):
                return "\(BaseUrl.main.rawValue)/player/\(id)\(season.isEmpty ? "" : "?season=\(season)")"
            case .updatePlayer(let id):
                return "\(BaseUrl.main.rawValue)/player/\(id)/update"
            }
        }
    }
    
}
