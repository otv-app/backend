//
//  TweetTest.swift
//  OTVModelTests
//
//  Created by Patrick Yoon on 7/28/20.
//  Copyright © 2020 Patrick Yoon. All rights reserved.
//

import XCTest

class TweetTest: XCTestCase {

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

    
    func testTweetHowLongAgo() throws {
        let tr = DatabaseRepository()
        
        let expectation = self.expectation(description: "Scaling")
        var testNull = false
        
        var tweetList = [Tweet]()
        
        tr.getListOfTweets {
            tweets in
            if (tweets.count != 0) {
                testNull = true
                tweetList = tweets
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        try XCTAssertEqual("5 minutes ago", tweetList[2].getHowLongAgo())
    }
}
