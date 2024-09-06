//
//  MainView.swift
//  TodoApp
//
//  Created by Mustafa Ölmezses on 4.09.2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel  = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn , !viewModel.currentUserId.isEmpty{
            accountView
        }else{
            LoginView()
        }
    }
    
    
    @ViewBuilder
    var accountView: some View{
        TabView {
            TodoListView(userId:viewModel.currentUserId)
                .tabItem {
                    Label("Profil" , systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profil" , systemImage: "person.circle")
                }
        }
    }
}




#Preview {
    MainView()
}
