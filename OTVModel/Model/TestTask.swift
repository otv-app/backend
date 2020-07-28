//
//  TestTask.swift
//  OTVModel
//
//  Created by Patrick Yoon on 7/9/20.
//  Copyright © 2020 Patrick Yoon. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class TestTask {
    let id: String
    let pfp: String
    
    init(id: String, pfp: String) {
        self.id = id
        self.pfp = pfp
    }
}
