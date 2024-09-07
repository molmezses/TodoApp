//
//  TodoListView.swift
//  TodoApp
//
//  Created by Mustafa Ölmezses on 4.09.2024.
//

import SwiftUI
import FirebaseFirestore



struct TodoListView: View {
    
    @StateObject var viewModel : TodoListViewViewModel
    @FirestoreQuery var items: [TodoListItem]
    
    
    
    init(userId:String){
        
        self._items = FirestoreQuery(collectionPath: "Users/\(userId)/Todos")
        self._viewModel = StateObject(wrappedValue: TodoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                List(items){ item in
                    TodoListItemView(item: item)
                        .swipeActions{
                            Button("sil"){
                                viewModel.delete(id: item.id)
                            }
                            .background(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Quests 🔖")
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
    TodoListView(userId: "rpPsDhnRy9Tn2COsD9afxjzsGoM2")
}
