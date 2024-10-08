//
//  BigStrokeButton.swift
//  TodoApp
//
//  Created by Mustafa Ölmezses on 5.09.2024.
//

import SwiftUI

struct BigStrokeButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        
        Button(action:action , label: {
            Text(title)
                .foregroundStyle(.white)
                .font(.headline)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
        })
        .background(
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(Color("prup"))
                .frame(height: 48)
                .padding(.horizontal , 4)
        )
        .padding()
        
    }
}

#Preview {
    BigStrokeButton(title: "String", action: {})
}
