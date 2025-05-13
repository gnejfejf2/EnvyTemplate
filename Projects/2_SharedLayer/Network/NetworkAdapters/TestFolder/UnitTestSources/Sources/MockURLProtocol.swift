//
//  MockURLProtocol.swift
//  NetworkKit
//
//  Created by 강지윤 on 4/26/25.
//
import Foundation
import Foundation
import NetworkInterface

final class MockNetworkProvider: NetworkProviderProtocol {
    
    var result: Result<Data, Error> = .failure(NSError(domain: "noMockData", code: -1))
    
    func asyncRequest<R: Codable>(with requestModel: any RequestModelProtocol) async throws -> R {
        switch result {
        case .success(let data):
            do {
                return try JSONDecoder().decode(R.self, from: data)
            } catch {
                throw NetworkErrorEnum.decodeError
            }
        case .failure(let error):
            throw error
        }
    }
}
