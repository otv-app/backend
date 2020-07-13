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
    
    func loadData() -> DocumentReference {
        // collection name
        let docRef = db.collection("test").document("test2")
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
            }
        }
        
        print(docRef)
        
        return docRef
    }
}
