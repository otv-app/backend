//
//  DatabaseRepository.swift
//  OTVModel
//
//  Created by Patrick Yoon on 7/28/20.
//  Copyright © 2020 Patrick Yoon. All rights reserved.
//

import Foundation
import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Firebase

class DatabaseRepository {
    let db = Firestore.firestore()
    
    func getListOfTweets(completion: @escaping ([Tweet]) -> ()) {
        db.collection("tweets").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("error getting documents: \(err)")
            } else {
                var tweets = [Tweet]()
                
                for document in querySnapshot!.documents{
                    let docData = document.data()
                    let tempTimestamp = docData["created_at"] as! Timestamp
                    let tempDate = Date(timeIntervalSince1970: TimeInterval(tempTimestamp.seconds))
                    let tempTweet = Tweet(id: document.documentID,
                                          name: docData["name"] as! String,
                                          screenname: docData["screenname"] as! String,
                                          created_at: tempDate,
                                          text: docData["text"] as! String,
                                          pfpURL: docData["pfp_url"] as! String,
                                          retweet_count: docData["retweet_count"] as! Int,
                                          like_count: docData["favorite_count"] as! Int)
                    tweets.insert(tempTweet, at: 0)
                    print("\(document.documentID) => \(document.data())")
                }
                completion(tweets)
            }
        }
    }
}
