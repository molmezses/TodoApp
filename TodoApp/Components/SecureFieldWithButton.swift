//
//  SecureFieldWithButton.swift
//  TodoApp
//
//  Created by Mustafa Ölmezses on 5.09.2024.
//

import SwiftUI

struct SecureFieldWithButton: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title : String
    
    init(text: Binding<String>, title: String) {
        self._text = text
        self.title = title
    }
    
    var body: some View {
        ZStack(alignment:.trailing){
            Group {
                if isSecured{
                    SecureField(title, text: $text)
                        .modifier(TextFieldModifier())
                }else{
                    TextField(title, text: $text)
                        .modifier(TextFieldModifier())
                }
            }
            Button(action: {
                isSecured.toggle()
            }, label: {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .tint(.gray)
                    .imageScale(.large)
                    .padding(.trailing , 36)
            })
            
        }
    }
}

#Preview {
    SecureFieldWithButton(text: .constant(""), title: "Password")
}
