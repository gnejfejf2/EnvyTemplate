//
//  dommy.swift
//  ProjectDescriptionHelpers
//
//  Created by Envy on 20/09/2023.
//

import Foundation
import LocalDBInterface


public final class LocalDBProvider: LocalDBProviderProtocol {
    let defaults = UserDefaults.standard
    
    public init() {
        
    }
    
    public func saveObject<T: Codable>(keyword: String, item: T) throws {
        try saveCustomObject(item, forKey: keyword) 
    }
    
    public func deleteObject(keyword: String) {
        defaults.removeObject(forKey: keyword)
    }
    
    public func getObject<T: Codable>(keyword: String) throws -> T? {
        let result =  try? getCustomObject(forKey: keyword, castTo: T.self)
        return result
    }
    
    private func saveCustomObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable {
         let encoder = JSONEncoder()
         do {
             let data = try encoder.encode(object)
             defaults.set(data, forKey: forKey)
         } catch {
             throw ObjectSavableError.unableToEncode
         }
     }
     
     private func getCustomObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable {
         guard let data = defaults.data(forKey: forKey) else { throw ObjectSavableError.noValue }
         let decoder = JSONDecoder()
         do {
             let object = try decoder.decode(type, from: data)
             return object
         } catch {
             throw ObjectSavableError.unableToDecode
         }
     }
    
}
