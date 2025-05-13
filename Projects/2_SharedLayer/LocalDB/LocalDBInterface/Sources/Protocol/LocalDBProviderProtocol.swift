import Foundation

public protocol LocalDBProviderProtocol {
    
    func saveObject<T: Codable>(keyword: String, item: T) throws
    
    func deleteObject(keyword: String)
    
    func getObject<T: Codable>(keyword: String) throws -> T?
    
}
