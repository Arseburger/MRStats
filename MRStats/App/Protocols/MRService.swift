import Foundation

protocol MRService {
    var service: NetworkService? { get }
    init(service: NetworkService)
    associatedtype ResponseResult
}

extension MRService {
    var unknownError: Error {
        ApiClient.Errors.unknownError
    }
}
