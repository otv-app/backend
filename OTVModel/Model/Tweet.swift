//
//  Tweet.swift
//  OTVModel
//
//  Created by Patrick Yoon on 7/7/20.
//  Copyright © 2020 Patrick Yoon. All rights reserved.
//

import Foundation

class Tweet {
    let id: String
    let url: String
    let name: String
    let screenname: String
    let created_at: Date
    let text: String
    let pfpURL: String
    let retweet_count: Int
    let like_count: Int
    
    init(id: String, name: String, screenname: String, created_at: Date, text: String, retweet_count: Int, like_count: Int) {
        self.id = id
        self.name = name
        self.screenname = screenname
        self.url = "https://twitter.com/" + self.screenname + "/status/" + self.id
        self.pfpURL = "https://twitter.com/" + self.screenname
        self.text = text
        self.created_at = created_at
        self.retweet_count = retweet_count
        self.like_count = like_count
    }
    
    func getHowLongAgo() throws -> String {
        return try Utility.getHowLongAgoDates(date1: Utility.getUTCDateTime(currentDate: self.created_at), date2: Utility.getUTCDateTime(currentDate: Date()))
    }
}
