//
//  Button.swift
//  ToDoListApp
//
//  Created by Anatolii Shumov on 17/07/2023.
//

import SwiftUI

struct TDLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .padding()
    }
}

struct TDLButton_Previews: PreviewProvider {
    static var previews: some View {
        TDLButton(title: "Title", background: .blue) {
            
        }
    }
}
