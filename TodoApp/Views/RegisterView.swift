//
//  RegisterView.swift
//  TodoApp
//
//  Created by Mustafa Ölmezses on 4.09.2024.
//

import SwiftUI

struct RegisterView: View {
    
//    @State var name: String = ""
//    @State var email: String = ""
//    @State var password: String = ""
    
    @StateObject var viewModel = RegisterViewViewModel()
    
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
                if !viewModel.errorMessage.isEmpty{
                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                        .padding()
                }
                
                TextField("Enter a name :", text: $viewModel.name)
                    .modifier(TextFieldModifier())
                TextField("Enter a E-mail adress :", text: $viewModel.email)
                    .modifier(TextFieldModifier())
                SecureFieldWithButton(text: $viewModel.password, title: "Password")
                    .padding(.bottom)
                
                BigStrokeButton(title: "Sign Up") {
                    viewModel.register()
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


