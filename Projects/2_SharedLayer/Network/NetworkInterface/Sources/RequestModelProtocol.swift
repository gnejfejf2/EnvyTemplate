//
//  Untitled.swift
//  NetworkInterface
//
//  Created by 강지윤 on 4/23/25.
//

import Foundation

public protocol RequestModelProtocol {
    associatedtype NetworkPathEnum
    
    var baseURL: String { get set }
    
    var path: NetworkPathEnum { get set }
    
    var method: HttpMethodEnum { get set }
    
    var queryParameters: Encodable? { get set }
    
    var bodyParameters: Encodable? { get set }
    
    var headers: [String : String]? { get set }
    
    func getUrl() throws -> URL
    
    func getUrlRequest() throws -> URLRequest
}
