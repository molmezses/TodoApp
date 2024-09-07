//
//  TodoListView.swift
//  TodoApp
//
//  Created by Mustafa Ölmezses on 4.09.2024.
//

import SwiftUI

struct TodoListView: View {
    
    @StateObject var viewModel = TodoListViewViewModel()
    private let userId: String
    
    init(userId:String){
        self.userId = userId
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                
            }
            .navigationTitle("Quests")
            .toolbar{
                Button {
                    //sheet açma komuları
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

#Preview {
    TodoListView(userId: "sda")
}
