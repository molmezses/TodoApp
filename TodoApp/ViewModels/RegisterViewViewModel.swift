//
//  RegisterViewViewModel.swift
//  TodoApp
//
//  Created by Mustafa Ölmezses on 4.09.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject{
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    init(){}
    
    func register(){
        guard validate() else {return}
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {return}
            
            //İNSERT METODU ÇAGIRALACAK
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        
        db.collection("Users").document(id).setData(newUser.asDictonary())
    }
    
    func validate() -> Bool{
        
        errorMessage = ""
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else{
            errorMessage = "Please fill in all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "please enter a valid email address"
            return false
        }
        
        guard password.count > 6 else{
            errorMessage =  "Please create a password of 6 or more characters"
            return false
        }
        
        return true
    }
}
