import XCTest
import LocalDBInterface
@testable import LocalDBKit
@testable import LocalDBKitTestSources

final class LocalDBProviderTests: XCTestCase {
    
    var dbProvider: LocalDBProviderProtocol!
    
    override func setUp() {
        super.setUp()
        dbProvider = MockLocalDBProvider()
    }
    
    override func tearDown() {
        dbProvider = nil
        super.tearDown()
    }
    
    func testSaveAndGetLocalDB() throws {
        //given
        let item = MockLocalDBModel(value: "LocalDBTest", count: 0)
        let keyword = "testItem"
        
        // when
        try dbProvider.saveObject(keyword: keyword, item: item)
        let loadedItem: MockLocalDBModel? = try dbProvider.getObject(keyword: keyword)
        
        // then
        XCTAssertEqual(loadedItem, item)
    }
    
    func test_getObject_returnsNil_whenNoData() throws {
        // given¨
        let keyword = "testItem"
        
        // when
        let loadedItem: String? = try dbProvider.getObject(keyword: keyword)
        
        // then
        XCTAssertNil(loadedItem)
    }
    
    func test_deleteObject_success() throws {
        
        let item = MockLocalDBModel(value: "LocalDBTest", count: 0)
        let keyword = "testItem"
        try dbProvider.saveObject(keyword: keyword, item: item)
        // when
        dbProvider.deleteObject(keyword: keyword)
        let deletedItem: MockLocalDBModel? = try dbProvider.getObject(keyword: keyword)
        // then
        XCTAssertNil(deletedItem)
    }
}
