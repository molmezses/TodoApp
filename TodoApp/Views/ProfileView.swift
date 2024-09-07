//
//  ProfileView.swift
//  TodoApp
//
//  Created by Mustafa Ölmezses on 4.09.2024.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    init(){}
    
    var body: some View {
        NavigationStack{
            VStack{
                
                if let user = viewModel.user{
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.blue)
                        .frame(width: 125 , height: 125)
                    VStack{
                        HStack{
                            Text("İsim:")
                            Text(user.name)
                        }
                        HStack{
                            Text("Email:")
                            Text(user.email)
                        }
                        HStack{
                            Text("Kayıt tarihi:")
                            Text("\(Date(timeIntervalSince1970:user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }
                    }
                }else{
                    Text("Profil Yüklenşyor")
                }
                
                
                
                
                //logout
                BigStrokeButton(title: "Log out") {
                    viewModel.logOut()
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
