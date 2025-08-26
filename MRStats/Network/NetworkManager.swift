import Foundation
import UIKit

final class NetworkManager {
    
    enum Errors: String, Error {
        case invalidUrl
        case invalidResponse
        case invalidData
        case updateFailed
        case decodingError
    }
    
    static let shared = NetworkManager()
    private var cache: [String: UIImage] = [:]
    private let queue: DispatchQueue = .init(label: "network.queue", qos: .userInteractive, attributes: .concurrent)
    private let headers = [
        "Content-Type": "application/json",
        "x-api-key": "143ac4112c2d0ab19b19fef8e12691c5ab7e66ccfed6f9a11db08cf5351dc2ac"
    ]
    
    init() {}
    
    func downloadImage(from stringUrl: String, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = cache[stringUrl] {
            completion(cachedImage)
        } else {
            guard let url = URL(string: ApiClient.BaseUrl.source.rawValue + stringUrl) else { return }
            var request = URLRequest(url: url)
            request.allHTTPHeaderFields = self.headers
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                
                guard let data, let image = UIImage(data: data) else {
                    completion(nil)
                    return
                }
                
                self.cache.updateValue(image, forKey: stringUrl)
                completion(image)
            }
            task.resume()
        }
    }
}
