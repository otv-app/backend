//
//  TestRepository.swift
//  
//
//  Created by Patrick Yoon on 7/9/20.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Firebase


class TestRepository: ObservableObject {
    let db = Firestore.firestore()
    
    @Published var tests = [TestTask]()
    
    func loadData(completion: @escaping (TestTask) -> ()) {
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
                let numText = document.get("numb") as! String
                print("DocID: \(docID), Text: \(consoleText)")
               
                completion(TestTask(id: consoleText, pfp: numText))
            } else {
                print("Document does not exist")
                completion(TestTask(id: "", pfp: ""))
            }
        }
    }
    
    func postData() -> String{
        Firestore.firestore().collection("items").document("yourId").setData(["item": "test"])
        return ""
    }
    
    func getRealTimeDatabase(completion: @escaping (TestTask) -> ()) {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        ref.child("youtube").child("testChannel1").observeSingleEvent(of: .value, with: { (snapshot) in
          // Get user value
          let value = snapshot.value as? NSDictionary
          let idTest = value?["id"] as? String ?? ""
          let pfpTest = value?["pfp"] as? String ?? ""
          let user = TestTask(id: idTest, pfp: pfpTest)
          print(user)
          completion(user)
          // ...
            
          }) { (error) in
            print(error.localizedDescription)
        }
    }

}
