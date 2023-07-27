//
//  LoginViewModel.swift
//  ToDoListApp
//
//  Created by Anatolii Shumov on 17/07/2023.
//
import FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            guard error != nil else { return }
            self.errorMessage = error!.localizedDescription
        }
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields."
            return false }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email."
            return false }
        
        return true
    }
}
