//
//  ProfileViewViewModel.swift
//  ToDoListApp
//
//  Created by Ilona Punya on 3.05.23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfileViewViewModel: ObservableObject {
    @Published var user: User? = nil
    init () { }
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { snapshot, error in
            guard let data = snapshot?.data(), error  == nil else {
                return
            }
            DispatchQueue.main.async { [weak self] in
                self?.user = User(name: data["name"] as? String ?? "",
                                  id: data["id"] as? String ?? "",
                                  email: data["email"] as? String ?? "",
                                  joined: data["joined"] as? TimeInterval ?? 0)
            }
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
}
