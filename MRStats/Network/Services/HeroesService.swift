import Foundation

final class HeroesService: MRService {
    typealias ResponseResult = Result<[Hero], Error>
    private(set) weak var service: NetworkService?
    
    @MainActor
    func loadHeroes() async throws -> Result<[Hero], Error> {
        do {
            return try await self.service?.request(endpoint: .heroes) ?? .success([Hero]())
        } catch {
            return .failure(ApiClient.Errors.unknownError)
        }
    }
    
    // MARK: вот этот
    func getHeroes() async -> ResponseResult {
        do {
            return try await self.service?.request(endpoint: .heroes) ?? .success([Hero]())
        } catch {
            return .failure(self.unknownError)
        }
    }
    
    init(service: NetworkService) {
        self.service = service
    }
    
}
