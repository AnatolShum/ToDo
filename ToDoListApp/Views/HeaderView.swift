//
//  HeaderView.swift
//  ToDoListApp
//
//  Created by Anatolii Shumov on 17/07/2023.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            
            VStack {
                Text(title)
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .bold()
            }
            .padding(.top, 90)
        }
        .frame(width: UIScreen.main.bounds.width * 3,
               height: 300)
        .offset(y: -150)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", angle: 15, background: .indigo)
    }
}
