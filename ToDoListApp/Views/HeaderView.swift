//
//  HeaderView.swift
//  ToDoListApp
//
//  Created by Ilona Punya on 3.05.23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let backgroundColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundColor)
                .rotationEffect(Angle(degrees: angle))
            
            VStack {
                Text(title)
                    .font(.system(size: 55))
                    .bold()
                Text(subtitle)
                    .font(.system(size: 30))
            }
            .padding(.top, 50)
            .foregroundColor(.white)
        }
        .frame(width: UIScreen.main.bounds.width * 1.5, height: 350)
        .offset(y: -130)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, backgroundColor: .blue)
    }
}
