//
//  User.swift
//  ToDoListApp
//
//  Created by Anatolii Shumov on 17/07/2023.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
