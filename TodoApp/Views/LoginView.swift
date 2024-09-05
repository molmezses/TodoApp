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
                VStack{
                    LoginFormsView()
                    LoginGoogleView()
                }
                //FOOTER
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
                .frame(width: 240 , height: 100)
        }
        .padding()
    }
}

struct LoginFormsView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack{
            TextField("E-mail adress :", text: $email)
                .modifier(TextFieldModifier())

            
            SecureFieldWithButton(text: $password , title: "Password")
                
            
            Button("Forget password ? ") {
                
            }
            .foregroundStyle(Color("ACText"))
            .font(.footnote)
            .bold()
            .frame(maxWidth: .infinity , alignment: .trailing)
            .padding(.horizontal , 20)
            .padding(.vertical , 8)
            .foregroundStyle(.black)
            
            
            Button(action: {}, label: {
                Text("Sign in")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
            })
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 2)
                    .frame(height: 48)
                    .padding(.horizontal , 4)
            )
            .padding()
            
        }
    }
}

struct LoginGoogleView: View {
    var body: some View {
        VStack{
            HStack{
                Rectangle()
                    .frame(height: 1)
                Text("Or")
                Rectangle()
                    .frame(height: 1)
            }
            .foregroundStyle(.gray)
            .padding()
            .padding()
            
            HStack{
                Image("Google")
                    .resizable()
                    .frame(width: 60 , height: 60)
                Button(action: {}, label: {
                    Text("Sign in with your google account")
                })
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
            .foregroundStyle(Color("ACText"))
        }
    }
}
