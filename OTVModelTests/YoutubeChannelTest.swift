//
//  YoutubeChannelTest.swift
//  OTVModelTests
//
//  Created by Patrick Yoon on 7/5/20.
//  Copyright © 2020 Patrick Yoon. All rights reserved.
//

import XCTest

class YoutubeChannelTest: XCTestCase {

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

    
    func testGetVideoFromChannel() throws {
        let testChannel = try YoutubeChannel(id: "UCwV_0HmQkRrTcrReaMxPeDw")
        
        let videos = try testChannel.getVideos()
    
        
        XCTAssertEqual(20, videos.count)
        
        XCTAssertEqual("2020-07-03T15:39:06Z", videos[0].rawDate)
        XCTAssertEqual("2020-04-07T17:19:40Z", videos[19].rawDate)
    }
}
