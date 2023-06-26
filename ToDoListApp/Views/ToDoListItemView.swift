//
//  ToDoListItemView.swift
//  ToDoListApp
//
//  Created by Ilona Punya on 3.05.23.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack {
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
            }
            VStack (alignment: .leading) {
                Text(item.title)
                    .strikethrough(item.isDone)
                    .lineLimit(1)
                    .font(.body)
                    .bold()
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            .padding(.leading, 10)
            Spacer()
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: .init(id: "",
                                     title: "Title",
                                     dueDate: Date().timeIntervalSince1970,
                                     createDate: Date().timeIntervalSince1970,
                                     isDone: true))
    }
}
