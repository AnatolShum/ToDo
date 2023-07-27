//
//  ToDoItemListViewViewModel.swift
//  ToDoListApp
//
//  Created by Anatolii Shumov on 17/07/2023.
//

import FirebaseFirestore
import Foundation

class ToDoItemListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userID: String
    init(userID: String) {
        self.userID = userID
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userID)
            .collection("todos")
            .document(id)
            .delete()
    }
}
