//
//  AddTaskView.swift
//  Task Manager
//
//  Created by Vladyslav Dikhtiaruk on 24/04/2024.
//

import SwiftUI

struct AddTaskView: View {
    @Binding var show: Bool
    @Binding var inputTitle: String
    @Binding var inputDescription: String
    var action : () -> Void
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Create new task")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            VStack(spacing: 16) {
                TextField("Task title", text: $inputTitle)
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                    .shadow(radius: 10)
                    .font(.subheadline)
                
                
                TextField("Task description", text: $inputDescription)
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                    .shadow(radius: 10)
                    .font(.subheadline)
            }
            
            Button(
                action: {
                    action()
                    cleanInput()
                }, label: {
                    Text("Create")
                        .padding()
                        .foregroundStyle(.white)
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .background(.green)
                        .clipShape(.rect(cornerRadius: 10))
                        .padding(.horizontal)
                })
        }
    }
    func cleanInput() {
        inputTitle = ""
        inputDescription = ""
    }
}

#Preview {
    AddTaskView(show: .constant(true), inputTitle: .constant("Buy food"), inputDescription:.constant("Apple, Banana, and Orange"), action:{} )
}
