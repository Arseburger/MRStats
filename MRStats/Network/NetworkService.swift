import Foundation

final class NetworkConfiguration {
    private let apiKey = "143ac4112c2d0ab19b19fef8e12691c5ab7e66ccfed6f9a11db08cf5351dc2ac"
    
    func getHeaders() -> [String: String] {
        [
            "Content-Type": "application/json",
            "x-api-key": apiKey
        ]
    }
}

final class NetworkService {
    typealias Errors = NetworkManager.Errors
    private let configuration: NetworkConfiguration
    private lazy var session: URLSession = {
        URLSession(configuration: .default)
    }()
    
    var isLoading: Bool = false
    
    func request<T: Codable>(endpoint: ApiClient.Endpoints, params: String? = nil) async throws -> Result<T, Error> {
        isLoading = true
        let stringUrl = endpoint.url() + (params ?? "")
        guard let url = URL(string: stringUrl) else {
            isLoading = false
            return .failure(Errors.decodingError)
        }
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = configuration.getHeaders()
        
        if let response = try? await session.data(for: request) {
            let data = response.0
            if let decodedData = try? JSONDecoder().decodeDetailed(T.self, from: data) {
                isLoading = false
                return .success(decodedData)
            } else {
                isLoading = false
                return .failure(Errors.decodingError)
            }
        } else {
            isLoading = false
            return .failure(Errors.invalidResponse)
        }
    }
    
    init(configuration: NetworkConfiguration) {
        self.configuration = configuration
    }
}

