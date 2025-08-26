import Foundation

final class PlayersService: MRService {
    typealias ResponseResult = Result<PlayerResponse, Error>
    
    private(set) weak var service: NetworkService?
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func find(player name: String) async -> Result<SearchQuery, Error> {
        do {
            return try await service?.request(endpoint: ApiClient.Endpoints.findPlayer(name)) ?? .success(.init(id: UUID().uuidString, name: name))
        } catch {
            return .failure(self.unknownError)
        }
        
    }
    
    func load(player id: String, season: String) async -> ResponseResult {
        do {
            return try await service?.request(endpoint: .loadPlayer(id, season)) ?? .success(PlayerResponse.empty)
        } catch {
            return .failure(self.unknownError)
        }
    }
    
    func update(player id: String) async -> Result<UpdateStatus, Error> {
        do {
            return try await service?.request(endpoint: .updatePlayer(id)) ?? .success(UpdateStatus(success: true, error: false, message: "", status: nil))
        } catch {
            return .failure(NetworkManager.Errors.updateFailed)
        }
    }
}
