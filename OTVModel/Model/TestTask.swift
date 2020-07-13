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

struct TestTask: Codable, Identifiable {
    @DocumentID var id: String? = UUID().uuidString
    
    var text: String
    var yourMom: Int
}
