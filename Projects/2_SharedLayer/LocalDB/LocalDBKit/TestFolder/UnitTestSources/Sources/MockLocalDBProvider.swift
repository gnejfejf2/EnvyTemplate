//
import Foundation
import LocalDBInterface
@testable import LocalDBKit

final class MockLocalDBProvider: LocalDBProviderProtocol {

    private var storage: [String: Data] = [:]

    func saveObject<T: Codable>(keyword: String, item: T) throws {
        let data = try JSONEncoder().encode(item)
        storage[keyword] = data
    }
    
    func deleteObject(keyword: String) {
        storage.removeValue(forKey: keyword)
    }
    
    func getObject<T: Codable>(keyword: String) throws -> T? {
        guard let data = storage[keyword] else { return nil }
        return try JSONDecoder().decode(T.self, from: data)
    }
}
