//
//  TextFieldModifier.swift
//  TodoApp
//
//  Created by Mustafa Ölmezses on 5.09.2024.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content : Content)  -> some View {
        content
            .textInputAutocapitalization(.never)
            .font(.subheadline)
            .padding(16)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal , 24)
            .padding(.vertical , 8)
    }
}


