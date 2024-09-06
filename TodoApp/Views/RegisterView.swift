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
        ScrollView {
            HeaderView()
            VStack{
                Text("Register")
                    .frame(maxWidth: .infinity , alignment: .leading)
                    .padding(.leading , 30)
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color("prup"))
                TextField("Enter a name :", text: $name)
                    .modifier(TextFieldModifier())
                TextField("Enter a E-mail adress :", text: $email)
                    .modifier(TextFieldModifier())
                SecureFieldWithButton(text: $password, title: "Password")
                    .padding(.bottom)
                
                BigStrokeButton(title: "Sign Up") {
                    
                }
                Spacer()
                
            }
            .padding(.bottom , 30)
        }
    }
}


#Preview {
    RegisterView()
}


