//
//  Utility.swift
//  OTVModel
//
//  Created by Patrick Yoon on 7/3/20.
//  Copyright © 2020 Patrick Yoon. All rights reserved.
//

import Foundation
import Firebase

class Utility {
    static func getYoutubePFP(url: String) throws -> String {
        let file = URL(string: url)!
        let data = try Data(contentsOf: file)
        let decoded = try JSONDecoder().decode(YoutubePFP.self, from: data)
        
        for item in decoded.items {
            return item.snippet["thumbnails"]!.defaultThumb.url
        }
        
        throw UtilityError.failedYoutubePFP
    }
    
    static func getYoutubeUsername(url:String) throws -> String {
        let file = URL(string: url)!
        let data = try Data(contentsOf: file)

        let ticker = try JSONDecoder().decode(YoutubeChannelCoder.self, from: data)

        return ticker.items[0].snippet.channelTitle
    }
    
    static func firebase_test() throws -> String {
        let rootRef = Database.database().reference()
        let itemsRef = rootRef.child("youtube")
        print(itemsRef.value(forKey: "youtube"))
        
        return ""
        
    }
}

struct YoutubePFP: Codable {
    let items: [Snippet]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
}

struct Snippet: Codable {
    let snippet: [String: ThumbnailAll]
    
    enum CodingKeys: String, CodingKey {
        case snippet
    }
}

struct ThumbnailAll: Codable {
    let defaultThumb: Thumbnail
    let medium: Thumbnail
    let high: Thumbnail
    
    enum CodingKeys: String, CodingKey {
        case defaultThumb = "default"
        case medium
        case high
    }
}

struct Thumbnail: Codable {
    let url: String
    let width: Int
    let height: Int
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case width
        case height
    }
    
}

struct YoutubeChannelCoder: Codable {
    let kind: String
    let etag: String
    let nextPageToken: String
    let regionCode: String
    let pageInfo: PageInfo
    let items: [VideoInfo]
    
    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case etag = "etag"
        case nextPageToken = "nextPageToken"
        case regionCode = "regionCode"
        case pageInfo
        case items
    }
}

struct PageInfo: Codable {
    let totalResults: Int
    let resultsPerPage: Int
    
    enum CodingKeys: String, CodingKey {
        case totalResults
        case resultsPerPage
    }
}

struct VideoInfo: Codable {
    let kind: String
    let etag: String
    let id: VideoIdent
    let snippet: VideoSnippet
    
    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case etag = "etag"
        case id
        case snippet
    }
}

struct VideoIdent: Codable {
    let kind: String
    let videoId: String
    
    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case videoId = "videoId"
    }
}

struct VideoSnippet: Codable {
    let publishedAt: String
    let channelId: String
    let title: String
    let description: String
    let thumbnails: ThumbnailAll
    let channelTitle: String
    let liveBroadcastContent: String
    let publishTime: String
    
    enum CodingKeys: String, CodingKey {
        case publishedAt = "publishedAt"
        case channelId = "channelId"
        case title = "title"
        case description = "description"
        case thumbnails
        case channelTitle = "channelTitle"
        case liveBroadcastContent = "liveBroadcastContent"
        case publishTime = "publishTime"
    }
}

enum UtilityError: Error {
    case failedYoutubePFP
}
