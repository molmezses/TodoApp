//
//  LoginView.swift
//  TodoApp
//
//  Created by Mustafa Ölmezses on 4.09.2024.
//

import SwiftUI

struct LoginView: View {
    

    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                //HEADER
                HeaderView()
                //FORM
                LoginFormsView()
                //FOOTER
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Divider()
                FooterView()
                
                
            }
        }
    }
}

#Preview {
    LoginView()
}

struct HeaderView: View {
    var body: some View {
        ZStack{
            Image("TodoImage")
                .resizable()
                .frame(width: 320 , height: 300)
        }
        .padding()
    }
}

struct LoginFormsView: View {
    
//    @State var email: String = ""
//    @State var password: String = ""
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        VStack{
            Text("Login")
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
            TextField("E-mail adress :", text: $viewModel.email)
                .modifier(TextFieldModifier())

            
            SecureFieldWithButton(text: $viewModel.password , title: "Password")
                
            
            Button("Forget password ? ") {
                
            }
            .foregroundStyle(Color("prup"))
            .font(.footnote)
            .bold()
            .frame(maxWidth: .infinity , alignment: .trailing)
            .padding(.horizontal , 20)
            .padding(.vertical , 8)
            .foregroundStyle(.black)
            
            BigStrokeButton(title: "Sign in") {
                viewModel.login()
            }
            
        }
    }
}



struct FooterView: View {
    var body: some View {
        HStack{
            Text("Don't your have an account ? ")
            NavigationLink("Sign Up") {
                RegisterView()
            }
            .bold()
            .foregroundStyle(Color("prup"))
        }
    }
}
