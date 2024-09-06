//
//  User.swift
//  TodoApp
//
//  Created by Mustafa Ölmezses on 4.09.2024.
//

import Foundation

struct User: Codable{
    let id : String
    let name: String
    let email: String
    let joined: TimeInterval
}
