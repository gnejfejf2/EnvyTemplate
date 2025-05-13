//
//
import XCTest
import NetworkInterface
@testable import NetworkKit
@testable import NetworkKitTestSources

final class NetworkProviderTests: XCTestCase {
    
    var provider: NetworkProviderProtocol!
    
    override func setUp() {
        super.setUp()
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: config)
        provider = NetworkProvider(session: session, isShowNetworkLog: false)
    }
    
    override func tearDown() {
        provider = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.stubResponse = nil
        MockURLProtocol.stubError = nil
        super.tearDown()
    }
    
    func testAsyncRequestSuccess() async throws {
        let expectedResponse = DummyResponse(id: 123, dummyMessage: "Success")
        let responseData = try! JSONEncoder().encode(expectedResponse)
        
        MockURLProtocol.stubResponseData = responseData
        MockURLProtocol.stubResponse = HTTPURLResponse(url: URL(string: "https://example.com")!,
                                                       statusCode: 200,
                                                       httpVersion: nil,
                                                       headerFields: nil)
        
        // when
        let result: DummyResponse = try await provider.asyncRequest(with: DummyRequest())
        
        // then
        XCTAssertEqual(result, expectedResponse)
    }
    
    func testAsyncRequestInvalidHttpStatusThrowsError() async {
        
        MockURLProtocol.stubResponse = HTTPURLResponse(url: URL(string: "https://example.com")!,
                                                       statusCode: 404,
                                                       httpVersion: nil,
                                                       headerFields: nil)
        MockURLProtocol.stubResponseData = Data()
        
        // when
        do {
            let _: String = try await provider.asyncRequest(with: DummyRequest())
            XCTFail("Expected to throw, but succeeded")
        } catch {
            // then
            XCTAssertTrue(error is NetworkErrorEnum)
        }
    }
    
    func testAsyncRequestDecodeFailureThrowsDecodeError() async {
        
        
        
        MockURLProtocol.stubResponse = HTTPURLResponse(url: URL(string: "https://example.com")!,
                                                       statusCode: 200,
                                                       httpVersion: nil,
                                                       headerFields: nil)
        MockURLProtocol.stubResponseData = "Invalid JSON".data(using: .utf8)
        
        // when
        do {
            let _: String = try await provider.asyncRequest(with: DummyRequest())
            XCTFail("Expected decode error")
        } catch {
            // then
            XCTAssertTrue(error is NetworkErrorEnum)
            XCTAssertEqual((error as? NetworkErrorEnum)?.localizedDescription, NetworkErrorEnum.decodeError.localizedDescription)
        }
    }
}

