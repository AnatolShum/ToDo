//
//  ToDoItemList.swift
//  ToDoListApp
//
//  Created by Anatolii Shumov on 17/07/2023.
//

import SwiftUI

struct ToDoItemList: View {
    @StateObject var viewModel = ToDoItemListViewModel()
    let item: ToDoListItem
    
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill": "circle")
                    .foregroundColor(.blue)
            }

        }
    }
}

struct ToDoItemList_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemList(item: .init(id: "1233", title: "1234", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
    }
}
