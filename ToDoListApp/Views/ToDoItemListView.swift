//
//  ToDoItemListView.swift
//  ToDoListApp
//
//  Created by Anatolii Shumov on 17/07/2023.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoItemListView: View {
    @StateObject var viewModel: ToDoItemListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    private let userID: String
   
    init(userID: String) {
        self.userID = userID
        // users/<id>/todos/<entries>
        
        self._items = FirestoreQuery(collectionPath: "users/\(userID)/todos")
        
        self._viewModel = StateObject(wrappedValue: ToDoItemListViewViewModel(userID: userID))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoItemList(item: item)
                        .swipeActions {
                            Button {
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete")
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemListView(userID: "jnUgxCNWuZflTzpZg1V8NyMPNOo1")
    }
}
