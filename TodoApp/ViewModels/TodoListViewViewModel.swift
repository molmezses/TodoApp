//
//  TodoListViewViewModel.swift
//  TodoApp
//
//  Created by Mustafa Ölmezses on 4.09.2024.
//

import Foundation
import FirebaseFirestore

class TodoListViewViewModel: ObservableObject{
    @Published var showingNewItemView : Bool = false
    
    private let userId: String
    
    init(userId:String){
        self.userId = userId
    }
    
    func delete(id :String){
        let db = Firestore.firestore()
        db.collection("Users").document(userId).collection("Todos").document(id)
            .delete()
    }
    
    
}
