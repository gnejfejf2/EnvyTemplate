//
//  NetworkErrorEnum.swift
//  NetworkInterface
//
//  Created by 강지윤 on 4/23/25.
//

import Foundation

public enum NetworkErrorEnum: LocalizedError {
    case unknownError
    case invalidHttpStatusCode(Data?)
    case components
    case urlRequest(Error)
    case parsing(Error)
    case emptyData
    case decodeError
    case messageBased(String)
    
    public var errorDescription: String? {
        switch self {
        case .unknownError: return "알수 없는 에러입니다."
        case .invalidHttpStatusCode: return "status코드가 200~299가 아닙니다."
        case .components: return "components를 생성 에러가 발생했습니다."
        case .urlRequest: return "URL request 관련 에러가 발생했습니다."
        case .parsing: return "데이터 parsing 중에 에러가 발생했습니다."
        case .emptyData: return "data가 비어있습니다."
        case .decodeError: return "decode 에러가 발생했습니다."
        case .messageBased(let message): return message
        }
    }
}
