//
//  TodoListItemViewViewModel.swift
//  TodoApp
//
//  Created by Mustafa Ölmezses on 4.09.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class TodoListItemViewViewModel : ObservableObject{
    init() {
        
    }
    
    func toggleIsDone(item: TodoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db  = Firestore.firestore()
        db.collection("Users").document(uid).collection("Todos").document(item.id).setData(itemCopy.asDictonary())
    }
    
}
