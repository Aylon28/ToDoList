//
//  MainViewViewModel.swift
//  ToDoListApp
//
//  Created by Ilona Punya on 3.05.23.
//

import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject {
    @Published var currenUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currenUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
