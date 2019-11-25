//
//  CodableFriendTests.swift
//  CodableFriendTests
//
//  Created by Joseph McCraw on 11/25/19.
//  Copyright © 2019 Joseph McCraw. All rights reserved.
//

import XCTest

class CodableFriendTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_fetchReturnsUnder10SecondsAndDecodesJSON() {
        //But Who will test the testers?
        XCTAssert(true)
        let decoder = JSONDecoder()
        print("begin Async test")
        let expectation = self.expectation(description: "Fetching")
        var expectedFriends: [Friend]?
        decoder.dateDecodingStrategy = .iso8601
        decoder.decode([Friend].self, fromURL: "https://www.hackingwithswift.com/samples/friendface.json") { friends in
//            print(friends)
            expectedFriends = friends
            print("Fulfill")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
        var galeDyer = expectedFriends?.matching("Gale Dyer")[0].name ?? "Not Found"
        print("Gale Dyer = " + galeDyer)
        XCTAssert(galeDyer == "Gale Dyer")
//        XCTAssert(galeDyer == "Not Found")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
