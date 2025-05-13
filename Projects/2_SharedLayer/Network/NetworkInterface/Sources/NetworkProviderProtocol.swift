//
//  NetworkProviderProtocol.swift
//  NetworkInterface
//
//  Created by 강지윤 on 4/23/25.
//

import Foundation

public protocol NetworkProviderProtocol {
    func asyncRequest<R: Codable>(with requestModel: any RequestModelProtocol) async throws -> R
}
