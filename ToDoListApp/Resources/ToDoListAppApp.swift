//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by Anatolii Shumov on 17/07/2023.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoListAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
