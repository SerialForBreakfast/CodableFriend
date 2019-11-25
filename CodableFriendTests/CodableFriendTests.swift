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
    
    func testExample() {
        let decoder = JSONDecoder()
        decoder.decode([Friend].self, fromURL: "https://www.hackingwithswift.com/samples/friendface.json") { friends in
            let galeDyer = friends.matching("Gale Dyer")[0]
            print(galeDyer)
            XCTAssert(galeDyer.name == "Gale Dyer")
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
