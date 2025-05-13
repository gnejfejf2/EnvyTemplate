import Foundation
import NetworkInterface
import os.log

public final class NetworkProvider: NetworkProviderProtocol {
    
    let session: URLSession
    private let isShowNetworkLog: Bool
    private let logger: Logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "NetworkProvider",
                                        category: "Network")
    
    public init(session: URLSession = URLSession.shared,
                isShowNetworkLog: Bool) {
        self.session = session
        self.isShowNetworkLog = isShowNetworkLog
    }
    
    public func asyncRequest<R: Codable>(with requestModel: any RequestModelProtocol) async throws -> R {
        do {
            let urlRequest = try requestModel.getUrlRequest()
            
            // URL 로그 출력
            logRequestStart(urlRequest: urlRequest)
            let (data, response) = try await session.data(for: urlRequest)
            logRequestEnd(url: urlRequest.url?.absoluteString ?? "Unknown", error: nil)
            
            try validateAsyncResponse(data: data, response: response)
            // Decode data
            do {
                return try JSONDecoder().decode(R.self, from: data)
            } catch {
                throw NetworkErrorEnum.decodeError
            }
        } catch let networkError as NetworkErrorEnum {
            throw networkError
        } catch {
            throw NetworkErrorEnum.urlRequest(error)
        }
    }
    
    private func validateAsyncResponse(data: Data?, response: URLResponse?) throws {
        if let data = data,
           let errorModel = try? JSONDecoder().decode(ErrorMessageModel.self, from: data) {
            throw NetworkErrorEnum.messageBased(errorModel.message)
        }
        
        guard let response = response as? HTTPURLResponse else {
            throw NetworkErrorEnum.unknownError
        }
        
        guard (200...299).contains(response.statusCode) else {
            throw NetworkErrorEnum.invalidHttpStatusCode(data)
        }
    }
    
    private func decode<T: Decodable>(data: Data) -> Result<T, Error> {
        do {
            let decoded = try JSONDecoder().decode(T.self, from: data)
            return .success(decoded)
        } catch {
            return .failure(NetworkErrorEnum.decodeError)
        }
    }
    
    // MARK: - Logging & Metrics
    
    private func logRequestStart(urlRequest: URLRequest) {
        let urlString = urlRequest.url?.absoluteString ?? "Invalid URL"
        logger.info("🌐 Network Request Started: \(urlString)")
        
        if isShowNetworkLog {
            let httpMethod = urlRequest.httpMethod ?? "Unknown"
            
            if let headers = urlRequest.allHTTPHeaderFields {
                logger.debug("📝 Headers: \(headers)")
            }
            
            logger.info("📝 Method: \(httpMethod)")
#if DEBUG
            if let bodyData = urlRequest.httpBody,
               let bodyString = String(data: bodyData, encoding: .utf8) {
                logger.debug("📝 Body: \(bodyString)")
            }
#endif
        }
    }
    
    private func logRequestEnd(url: String,
                               error: Error?) {
        guard isShowNetworkLog else { return }
        
        logger.info("⏱️ Request Completed: \(url)")
        
        if let error = error {
            logger.error("❌ Request Error: \(error.localizedDescription)")
        } else {
            logger.info("✅ Request Successful")
        }
    }
}


