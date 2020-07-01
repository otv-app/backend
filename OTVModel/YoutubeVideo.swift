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
    var title: String
    var thumbnailURL: String
    var rawDuration: String
    var rawDate: String
    
    init(dict: [String: String]) {
        self.id = dict["id"]!
        self.title = dict["title"]!
        self.thumbnailURL = dict["thumbnail"]!
        self.rawDuration = dict["duration"]!
        self.rawDate = dict["date"]!
    }
    
    func getHowLongAgo() throws -> String {
        let currentDate = Date()
        var calendar = Calendar.current
        
        calendar.timeZone = TimeZone(abbreviation: "UTC")!
        print(calendar.timeZone)
        
        let currentYear = calendar.component(.year, from: currentDate)
        let currentMonth = calendar.component(.month, from: currentDate)
        let currentDay = calendar.component(.day, from: currentDate)
        let currentHour = calendar.component(.hour, from: currentDate)
        let currentMinutes = calendar.component(.minute, from:currentDate)
        let currentSeconds = calendar.component(.second, from:currentDate)
        
        let videoDateTime = self.getDateTimeVideo()
        
        if currentYear > videoDateTime.year {
            if currentYear - videoDateTime.year == 1 {
                return "\(currentYear - videoDateTime.year) year ago"
            } else {
                return "\(currentYear - videoDateTime.year) years ago"
            }
        }
        else if currentMonth > videoDateTime.month {
            if currentMonth - videoDateTime.month == 1 {
                return "\(currentMonth - videoDateTime.month) month ago"
            } else {
                return "\(currentMonth - videoDateTime.month) months ago"
            }
        }
        else if currentDay > videoDateTime.day {
            let diffDay = currentDay - videoDateTime.day
            
            if diffDay > 0 && diffDay < 7 {
                if diffDay == 1 {
                    return "1 day ago"
                } else {
                    return "\(diffDay) days ago"
                }
            } else if diffDay >= 7 && diffDay < 14 {
                return "1 week ago"
            } else if diffDay >= 14 && diffDay < 21 {
                return "2 weeks ago"
            } else if diffDay >= 21 && diffDay < 32 {
                return "3 weeks ago"
            } else {
                throw YoutubeVideoError.failedHowLongAgo
            }
        }
        else if currentHour > videoDateTime.hour {
            if currentHour - videoDateTime.hour == 1 {
                return "1 hour ago"
            } else {
                return "\(currentHour - videoDateTime.hour) hours ago"
            }
        }
        else if currentMinutes > videoDateTime.minute {
            if currentMinutes - videoDateTime.minute == 1 {
                return "1 minute ago"
            } else {
                return "\(currentMinutes - videoDateTime.minute) minutes ago"
            }
        }
        else if currentSeconds > videoDateTime.second {
            if currentSeconds - videoDateTime.second == 1 {
                return "1 minute ago"
            } else {
                return "\(currentSeconds - videoDateTime.second) minutes ago"
            }
        }
        else {
            throw YoutubeVideoError.failedHowLongAgo
        }
    }
    
    func getDateTimeVideo() -> (year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) {
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
        
        return (year: year, month: month, day: day, hour: hour, minute: minute, second: second)
    }
    
    enum YoutubeVideoError: Error {
        case failedHowLongAgo
    }
}
