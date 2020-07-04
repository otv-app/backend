//
//  Utility.swift
//  OTVModel
//
//  Created by Patrick Yoon on 7/3/20.
//  Copyright © 2020 Patrick Yoon. All rights reserved.
//

import Foundation

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

enum UtilityError: Error {
    case failedYoutubePFP
}
