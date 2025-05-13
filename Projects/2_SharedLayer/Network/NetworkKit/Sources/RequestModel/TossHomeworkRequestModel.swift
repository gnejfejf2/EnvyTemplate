//
//  TossHomeworkRequestModel.swift
//  NetworkKit
//
//  Created by Envy on 14/4/25.
//
import Foundation
import NetworkInterface

public struct TemplateRequestModel: RequestModelProtocol {
    
    public var baseURL: String
    
    public var path: TemplatePath
    
    public var method: HttpMethodEnum
    
    public var queryParameters: Encodable?
    
    public var bodyParameters: Encodable?
    
    public var headers: [String : String]?
    
    public init(baseURL: String,
                path: TemplatePath,
                method: HttpMethodEnum,
                queryParameters: Encodable? = nil,
                bodyParameters: Encodable? = nil,
                headers: [String : String]? = nil) {
        self.baseURL = baseURL
        self.path = path
        self.method = method
        self.queryParameters = queryParameters
        self.bodyParameters = bodyParameters
        self.headers = headers
    }
    
    public func getUrlRequest() throws -> URLRequest {
        let url = try getUrl()
        var urlRequest = URLRequest(url: url)

        // httpBody
        if let bodyParameters = try bodyParameters?.toDictionary() {
            if !bodyParameters.isEmpty {
                urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: bodyParameters)
            }
        }

        // httpMethod
        urlRequest.httpMethod = method.rawValue

        // header
        headers?.forEach { urlRequest.setValue($1, forHTTPHeaderField: $0) }

        return urlRequest
    }

    public func getUrl() throws -> URL {

        // baseURL + path
        let fullPath = "\(baseURL)\(path.path)"
        guard var urlComponents = URLComponents(string: fullPath) else { throw NetworkErrorEnum.components }

        // (baseURL + path) + queryParameters
        var urlQueryItems = [URLQueryItem]()
        if let queryParameters = try queryParameters?.toDictionary() {
            queryParameters.forEach {
                urlQueryItems.append(URLQueryItem(name: $0.key, value: "\($0.value)"))
            }
        }
        urlComponents.queryItems = !urlQueryItems.isEmpty ? urlQueryItems : nil

        guard let url = urlComponents.url else { throw NetworkErrorEnum.components }
        return url
    }
    
}
