//
//  UtilityTest.swift
//  OTVModelTests
//
//  Created by Patrick Yoon on 7/3/20.
//  Copyright © 2020 Patrick Yoon. All rights reserved.
//

import XCTest

class UtilityTest: XCTestCase {

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

    func testGetYoutubePFPURL() throws {
        try XCTAssertEqual("https://yt3.ggpht.com/a/AATXAJyZS-nDV2ZSLtq6_HdbYF9ctxatCorB0MxFMQWZmg=s88-c-k-c0xffffffff-no-rj-mo", Utility.getYoutubePFP(url: "https://www.googleapis.com/youtube/v3/channels?part=snippet&id=UCwV_0HmQkRrTcrReaMxPeDw&fields=items%2Fsnippet%2Fthumbnails&key=AIzaSyDicp8qEd84ljPJrnzd388psVJNK3sMN2I"))
    }

    func testGetYoutubeChannelUsername() throws {
        try XCTAssertEqual("Disguised Toast", Utility.getYoutubeUsername(url: "https://www.googleapis.com/youtube/v3/search?key=AIzaSyDicp8qEd84ljPJrnzd388psVJNK3sMN2I&channelId=UCUT8RoNBTJvwW1iErP6-b-A&part=snippet,id&order=date&maxResults=20"))
    }
    
    
    func testGetYoutubeDuration() throws {
        try XCTAssertEqual("PT15M22S", Utility.getYoutubeVideoRawDuration(id: "Q6hT-gWbrZA"))
    }
}
