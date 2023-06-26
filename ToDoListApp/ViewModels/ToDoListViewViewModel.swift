//
//  ToDoListViewViewModel.swift
//  ToDoListApp
//
//  Created by Ilona Punya on 3.05.23.
//

import FirebaseFirestore
import Foundation

class ToDoListViewViewModel: ObservableObject {
    @Published var showNewItemView = false
    private let userId: String
    
    init (userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
