//
//  ToDoListItemViewViewModel.swift
//  ToDoListApp
//
//  Created by Ilona Punya on 3.05.23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewViewModel: ObservableObject {
    init () { }
    
    func toggleIsDone(item: ToDoListItem) {
        var copyItem = item
        copyItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(copyItem.id)
            .setData(copyItem.asDictionary())
    }
}
