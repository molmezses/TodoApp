//
//  LoginViewViewModel.swift
//  TodoApp
//
//  Created by Mustafa Ölmezses on 4.09.2024.
//

import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage = ""
    
    init() {}
     
    func login(){
        
        guard validate() else {return}
        
    }
    
    func validate() -> Bool{
        
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Please fill in all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".")
        else {
            errorMessage = "please enter a valid email address"
            return false
        }
        
        return true
        
    }

}
