//
//  MainViewModel.swift
//  ToDoListApp
//
//  Created by Anatolii Shumov on 17/07/2023.
//
import FirebaseAuth
import Foundation

class MainViewModel: ObservableObject {
    @Published var currentUserID = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserID = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
