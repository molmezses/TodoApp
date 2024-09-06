//
//  ProfileView.swift
//  TodoApp
//
//  Created by Mustafa Ölmezses on 4.09.2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    init(){}
    
    var body: some View {
        NavigationStack{
            VStack{
                
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
