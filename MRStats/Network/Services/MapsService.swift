import Foundation

final class MapsService: MRService {
    typealias ResponseResult = Result<MapResponse, Error>
    private(set) weak var service: NetworkService?
    
    func loadMaps(limit: Int) async -> ResponseResult {
        do {
            return try await self.service?.request(endpoint: .maps(limit)) ?? .success(.init(totalMaps: 0, maps: []))
        } catch {
            return .failure(self.unknownError)
        }
    }
    
    init(service: NetworkService) {
        self.service = service
    }
}
