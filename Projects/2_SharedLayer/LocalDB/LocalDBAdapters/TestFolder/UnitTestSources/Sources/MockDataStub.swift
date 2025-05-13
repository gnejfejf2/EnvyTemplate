//
//  MockDataStub.swift
//  LocalDBAdapters
//
//  Created by 강지윤 on 4/26/25.
//
import EnvyEntities
import Foundation

class MockDataStub {
    static let mockData: HomeworkDutchResponse = {
        let jsonDecoder = JSONDecoder()
        let item = try! jsonDecoder.decode(HomeworkDutchResponse.self, from: stubbedResponse("MockJson"))
        return item
    }()
    
    private static func stubbedResponse(_ filename: String) -> Data {
        guard let pathString = Bundle(for: MockDataStub.self).path(forResource: filename, ofType: "json") else {
            fatalError("Mock.json not found")
        }
        return (try! Data(contentsOf: URL(fileURLWithPath: pathString)))
    }
}
