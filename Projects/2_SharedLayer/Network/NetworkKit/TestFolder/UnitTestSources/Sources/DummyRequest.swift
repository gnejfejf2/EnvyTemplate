import NetworkInterface
import Foundation

struct DummyRequest: RequestModelProtocol {
    
    var baseURL: String = "https://example.com"
    
    var method: HttpMethodEnum = .get
    
    var path: String = ""
    
    var queryParameters: (any Encodable)? = nil
    
    var bodyParameters: (any Encodable)? = nil
    
    var headers: [String : String]? = nil
    
    func getUrl() throws -> URL {
        return URL(string: "https://example.com")!
    }
    func getUrlRequest() throws -> URLRequest {
        return URLRequest(url: URL(string: "https://example.com")!)
    }
    
}
