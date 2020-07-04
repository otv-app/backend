//
//  YoutubeChannel.swift
//  OTVModel
//
//  Created by Patrick Yoon on 7/3/20.
//  Copyright © 2020 Patrick Yoon. All rights reserved.
//

import Foundation

class YoutubeChannel {
    var id: String
    var username: String
    var pfpURL: String
    
    init(id: String) throws {
        self.id = id
        
        let pfpAPIURL = "https://www.googleapis.com/youtube/v3/channels?part=snippet&id=" + id + "&fields=items%2Fsnippet%2Fthumbnails&key=" + Key.YTAPIKEY
        
        self.pfpURL = try Utility.getYoutubePFP(url: pfpAPIURL)
        self.username = "test"
    }
}


