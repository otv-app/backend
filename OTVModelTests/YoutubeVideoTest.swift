//
//  YoutubeVideoTest.swift
//  OTVModelTests
//
//  Created by Patrick Yoon on 6/26/20.
//  Copyright © 2020 Patrick Yoon. All rights reserved.
//

import XCTest

class YoutubeVideoTest: XCTestCase {

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

    
    func testGetHowLongAgo() throws {
        let ytDict = ["id": "KeIx-mArUck",
                      "title": "What's the Difference Between Cloud Firestore & Firebase Realtime Database? #AskFirebase",
                      "thumbnail": "https://i.ytimg.com/vi/KeIx-mArUck/default.jpg",
                      "duration": "PT44M35S",
                      "date": "2018-07-01T2:40:08Z"
        ]
        
        
        let testYoutube = YoutubeVideo(dict: ytDict)

        // more than one year
        try XCTAssertEqual("2 years ago", testYoutube.getHowLongAgo())
        
        // one year ago
        testYoutube.rawDate = "2019-07-01T22:00:08Z"
        try XCTAssertEqual("1 year ago", testYoutube.getHowLongAgo())
        
        // more than one month ago
        testYoutube.rawDate = "2020-01-22T22:00:08Z"
        try XCTAssertEqual("5 months ago", testYoutube.getHowLongAgo())
        
        // one month ago
        testYoutube.rawDate = "2020-06-22T22:00:08Z"
        try XCTAssertEqual("1 week ago", testYoutube.getHowLongAgo())
        
    }
    
    func testChangingRawDurationDirectly() throws {
        let ytDict = ["id": "KeIx-mArUck",
                      "title": "What's the Difference Between Cloud Firestore & Firebase Realtime Database? #AskFirebase",
                      "thumbnail": "https://i.ytimg.com/vi/KeIx-mArUck/default.jpg",
                      "duration": "PT44M35S",
                      "date": "2018-07-01T2:40:08Z"
        ]
        
        
        let testYoutube = YoutubeVideo(dict: ytDict)
        let testYoutubeDate = testYoutube.getVideoDateTime()
        var calendar = Calendar.current
        
        calendar.timeZone = TimeZone(abbreviation: "UTC")!
        
        let year1 = calendar.component(.year, from: testYoutubeDate)
        let month1 = calendar.component(.month, from: testYoutubeDate)
        let day1 = calendar.component(.day, from: testYoutubeDate)
        let hour1 = calendar.component(.hour, from: testYoutubeDate)
        let minutes1 = calendar.component(.minute, from:testYoutubeDate)
        let seconds1 = calendar.component(.second, from:testYoutubeDate)
        
        XCTAssertEqual(2018, year1)
        XCTAssertEqual(7, month1)
        XCTAssertEqual(1, day1)
        XCTAssertEqual(2, hour1)
        XCTAssertEqual(40, minutes1)
        XCTAssertEqual(8, seconds1)
        
        testYoutube.rawDate = "2001-4-15T01:23:02Z"
        
        let testYoutubeDate2 = testYoutube.getVideoDateTime()
        var calendar2 = Calendar.current
        
        calendar2.timeZone = TimeZone(abbreviation: "UTC")!
        
        let year2 = calendar.component(.year, from: testYoutubeDate2)
        let month2 = calendar.component(.month, from: testYoutubeDate2)
        let day2 = calendar.component(.day, from: testYoutubeDate2)
        let hour2 = calendar.component(.hour, from: testYoutubeDate2)
        let minutes2 = calendar.component(.minute, from:testYoutubeDate2)
        let seconds2 = calendar.component(.second, from:testYoutubeDate2)
        
        XCTAssertEqual(2001, year2)
        XCTAssertEqual(4, month2)
        XCTAssertEqual(15, day2)
        XCTAssertEqual(1, hour2)
        XCTAssertEqual(23, minutes2)
        XCTAssertEqual(2, seconds2)
        
    }
}
