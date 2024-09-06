//
//  LoginHomeView.swift
//  TodoApp
//
//  Created by Mustafa Ölmezses on 6.09.2024.
//

import SwiftUI

struct LoginHomeView: View {
    var body: some View {
        VStack {
            HeaderView()
            HStack(alignment: .center){
                Text("Hedeflerinizi planlı bir şekilde gerçekleştirerek başarıya ulaşın")
                    .frame(alignment: .center)
            }
            
        }
    }
}

#Preview {
    LoginHomeView()
}
