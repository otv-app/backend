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
                      "date": "2018-01-22T22:00:08Z"
        ]
        
        
        let testYoutube = YoutubeVideo(dict: ytDict)

        // more than one year
        try XCTAssertEqual("2 years ago", testYoutube.getHowLongAgo())
        
        // one year ago
        testYoutube.rawDuration = "2019-01-22T22:00:08Z"
        try XCTAssertEqual("1 year ago", testYoutube.getHowLongAgo())
        
        // more than one month ago
        testYoutube.rawDuration = "2020-01-22T22:00:08Z"
        try XCTAssertEqual("6 months ago", testYoutube.getHowLongAgo())
        
        // one month ago
        testYoutube.rawDuration = "2020-06-22T22:00:08Z"
        try XCTAssertEqual("1 month ago", testYoutube.getHowLongAgo())
        
        // more than a day ago, less than a week
        testYoutube.rawDuration = "2020-07-26T22:00:08Z"
        try XCTAssertEqual("5 months ago", testYoutube.getHowLongAgo())
        
        //https://stackoverflow.com/questions/4084341/how-to-calculate-time-in-hours-between-two-dates-in-ios/4084356
    }
    
    func testGetDateTimeVideo() throws {
        let ytDict = ["id": "KeIx-mArUck",
                      "title": "What's the Difference Between Cloud Firestore & Firebase Realtime Database? #AskFirebase",
                      "thumbnail": "https://i.ytimg.com/vi/KeIx-mArUck/default.jpg",
                      "duration": "PT44M35S",
                      "date": "2018-01-22T22:00:08Z"
        ]
        
        let testYoutube = YoutubeVideo(dict: ytDict)
        
        let dateTime = testYoutube.getDateTimeVideo()
        
        XCTAssertEqual(2018, dateTime.year)
        XCTAssertEqual(1, dateTime.month)
        XCTAssertEqual(22, dateTime.day)
        XCTAssertEqual(22, dateTime.hour)
        XCTAssertEqual(0, dateTime.minute)
        XCTAssertEqual(8, dateTime.second)
    }
}
