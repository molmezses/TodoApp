//
//  RegisterView.swift
//  TodoApp
//
//  Created by Mustafa Ölmezses on 4.09.2024.
//

import SwiftUI

struct RegisterView: View {
    
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        HeaderView()
            .padding(.bottom , 60)
        VStack{
            TextField("Enter a name :", text: $name)
                .modifier(TextFieldModifier())
            TextField("Enter a E-mail adress :", text: $email)
                .modifier(TextFieldModifier())
            SecureFieldWithButton(text: $password, title: "Password")
                .padding(.bottom)
            
            BigStrokeButton(title: "Sign Up") {
                
            }
            
        }
        .padding(.bottom , 100)
    }
}


#Preview {
    RegisterView()
}


