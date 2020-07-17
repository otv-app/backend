//
//  TestRepository.swift
//  
//
//  Created by Patrick Yoon on 7/9/20.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


class TestRepository: ObservableObject {
    let db = Firestore.firestore()
    
    @Published var tests = [TestTask]()
    
    func loadData(completion: @escaping (Bool) -> ()) {
        // collection name
        let docRef = db.collection("test").document("test2")
        
        var docID : String = ""
        var consoleText: String = ""
        
        
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
                docID = document.documentID
                consoleText = document.get("text") as! String
                print("DocID: \(docID), Text: \(consoleText)")
               
                completion(true)
            } else {
                print("Document does not exist")
                completion(false)
            }
        }
    }
}
