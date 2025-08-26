import Foundation

enum JSONDecodingError: Error {
    case decodingFailed(underlying: Error)
}

extension JSONDecoder {
    func decodeDetailed<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        do {
            return try self.decode(type, from: data)
        } catch let error as DecodingError {
            switch error {
            case .typeMismatch(let expectedType, let context):
                print("Type mismatch. Expected type `\(expectedType)`")
                printContext(context)
            case .valueNotFound(let valueType, let context):
                print("Value not found for type `\(valueType)`")
                printContext(context)
            case .keyNotFound(let codingKey, let context):
                print("Key not found: `\(codingKey.stringValue)`")
                printContext(context)
            case .dataCorrupted(let context):
                print("⛔️ Data corrupted:")
                printContext(context)
            @unknown default:
                print("⛔️ Unknown decoding error: \(error)")
            }
            throw JSONDecodingError.decodingFailed(underlying: error)
        } catch { throw error }
    }
    
    private func printContext(_ context: DecodingError.Context) {
        let path = context.codingPath
            .map { $0.stringValue }
            .joined(separator: " → ")
        print("Coding Path: \(path)")
        print("Debug Description: \(context.debugDescription)")
        
        if let underlying = context.underlyingError {
            print("Underlying Error: \(underlying)")
        }
    }
}
