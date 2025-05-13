//
//  Untitled.swift
//  LocalDBInterface
//
//  Created by 강지윤 on 4/26/25.
//
import Foundation
public enum ObjectSavableError: String, LocalizedError {
    case unableToEncode = "Unable to encode object into data"
    case noValue = "No data object found for the given key"
    case unableToDecode = "Unable to decode object into given type"
    
    public var errorDescription: String? {
        rawValue
    }
}
