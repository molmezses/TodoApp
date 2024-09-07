//
//  TodoListItemView.swift
//  TodoApp
//
//  Created by Mustafa Ölmezses on 4.09.2024.
//

import SwiftUI

struct TodoListItemView: View {
    
    @StateObject var viewModel = TodoListItemViewViewModel()
    
    let item : TodoListItem
    
    var body: some View {
        HStack{
            VStack(alignment:.leading){
                Text(item.title)
                    .font(.title)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Button(action: {
                viewModel.toggleIsDone(item: item)
            }, label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "checkmark.circle")
                    .imageScale(.large)
            })
        }
    }
}

#Preview {
    TodoListItemView(item: .init(id: "123", title: "Abone ol", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}
