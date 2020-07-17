//
//  Repository.swift
//  OTVModelTests
//
//  Created by Patrick Yoon on 7/11/20.
//  Copyright © 2020 Patrick Yoon. All rights reserved.
//

import XCTest

class RepositoryTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testGetDoc() throws {
        let tr = TestRepository()
        
        let x: String = ""
        
        tr.loadData {
            success in
            
            if success {
                print("yo")
            } else {
                
            }
        }
    }
}
