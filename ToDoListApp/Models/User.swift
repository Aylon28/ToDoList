//
//  User.swift
//  ToDoListApp
//
//  Created by Ilona Punya on 3.05.23.
//

import Foundation

struct User: Codable {
    let name: String
    let id: String
    let email: String
    let joined: TimeInterval
}
