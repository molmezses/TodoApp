//
//  NewItemView.swift
//  TodoApp
//
//  Created by Mustafa Ölmezses on 4.09.2024.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented : Bool
    
    var body: some View {
        VStack{
            Form{
                TextField("Title", text: $viewModel.title)
                DatePicker("Duedate", selection: $viewModel.dueDate)
                    .datePickerStyle(.graphical)
                BigStrokeButton(title: "Save") {
                    if viewModel.canSave() {
                        viewModel.save()
                        newItemPresented = false
                    } else{
                        viewModel.showAlert = true
                    }
                    
                }
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("ERROR"), message: Text("Lütfen verilerin dğrulugunıu kontrol edin"), dismissButton: .cancel())
            })
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: {  _ in
         
    }))
}
