//
//  RegistrationViewViewModel.swift
//  ToDoListApp
//
//  Created by Ilona Punya on 3.05.23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class RegistrationViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init() { }
    
    func register() {
        guard validate() else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                print(error?.localizedDescription ?? "")
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(name: name, id: id, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        //errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            //errorMessage = "Please fill in all fields!"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            //errorMessage = "Please enter valid e-mail!"
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
}
