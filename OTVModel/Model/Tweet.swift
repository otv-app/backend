//
//  Tweet.swift
//  OTVModel
//
//  Created by Patrick Yoon on 7/7/20.
//  Copyright © 2020 Patrick Yoon. All rights reserved.
//

import Foundation

struct Tweet {
    let id: String
    let url: String
    let username: String
    let screename: String
    let created_at: String
    let content: String
    let pfpURL: String
    let retweet_count: Int
    let like_count: Int
    let reply_count: Int
}
