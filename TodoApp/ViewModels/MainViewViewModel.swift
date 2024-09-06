//
//  MainViewViewModel.swift
//  TodoApp
//
//  Created by Mustafa Ölmezses on 4.09.2024.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject{
    @Published var currentUserId: String = ""
    
    init(){
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
    
    
}
