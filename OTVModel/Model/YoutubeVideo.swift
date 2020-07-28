//
//  Video.swift
//  OTVModel
//
//  Created by Patrick Yoon on 6/26/20.
//  Copyright © 2020 Patrick Yoon. All rights reserved.
//

import Foundation
class YoutubeVideo {
    var id: String
    var url: String
    var title: String
    var thumbnailURL: String
    var rawDuration: String
    var rawDate: String
    
    init(id: String, title: String, thumbnailURL: String, rawDuration: String, rawDate: String) {
        self.id = id
        self.title = title
        self.thumbnailURL = thumbnailURL
        self.rawDuration = rawDuration
        self.rawDate = rawDate
        
        self.url = "https://www.youtube.com/watch?v=" + self.id
    }
    
    func getFormattedDuration() throws -> String {
        if rawDuration.contains("PT") {
            var newDuration = rawDuration
            newDuration.removeLast()
            newDuration.removeFirst(2)
            
            if newDuration.contains("H") {
                newDuration = newDuration.replacingOccurrences(of: "H", with: ":")
            }
            
            let returnedString = newDuration.replacingOccurrences(of: "M", with: ":")
            return returnedString
        } else {
            throw YoutubeVideoError.notProperlyFormatted
        }
    }
    
    func getHowLongAgo() throws -> String {
        let videoDate: Date = self.getVideoDateTime()
        
        return try Utility.getHowLongAgoDates(date1: videoDate, date2: Utility.getUTCDateTime(currentDate: Date()))
    }
    
    
    func getVideoDateTime() -> Date {
        let firstHalf = self.rawDate.components(separatedBy: "T")[0]
        var secondHalf = self.rawDate.components(separatedBy: "T")[1]
        
        let dateFormat = firstHalf.components(separatedBy: "-")
        let year: Int = Int(dateFormat[0])!
        let month: Int = Int(dateFormat[1])!
        let day: Int = Int(dateFormat[2])!
        
        secondHalf.removeLast()
        let timeFormat = secondHalf.components(separatedBy: ":")
        let hour: Int = Int(timeFormat[0])!
        let minute: Int = Int(timeFormat[1])!
        let second: Int = Int(timeFormat[2])!
    
        var dateComponents = DateComponents()
       dateComponents.year = year
       dateComponents.month = month
       dateComponents.day = day
       dateComponents.timeZone = TimeZone(abbreviation: "UTC")
       dateComponents.hour = hour
       dateComponents.minute = minute
       dateComponents.second = second
       
       let userCalendar = Calendar.current
       let someDateTime = userCalendar.date(from: dateComponents)
       return someDateTime!
    }
    
    enum YoutubeVideoError: Error {
        case negativeVideoDateTimeDifference
        case shouldntGetHere
        case notProperlyFormatted
    }
}
