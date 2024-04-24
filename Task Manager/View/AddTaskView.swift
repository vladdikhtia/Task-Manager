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
            
            VStack(spacing: 20) {
                TextField("Task title", text: $inputTitle)
                    .padding()
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                    .shadow(color: .white, radius: 8)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                
                TextField("Task description", text: $inputDescription)
                    .padding()
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                    .shadow(color: .white, radius: 8)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            
            Button(
                action: {
                    action()
                    cleanInput()
                }, label: {
                    Text("Create")
                        .padding()
                        .foregroundStyle(.green)
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .background(.black)
                        .clipShape(.rect(cornerRadius: 10))
                        .shadow(color: .white, radius: 10)
                        .padding(.horizontal)
                })
        }
    }
    private func cleanInput() {
        inputTitle = ""
        inputDescription = ""
    }
}

#Preview {
    AddTaskView(show: .constant(true), inputTitle: .constant("Buy food"), inputDescription:.constant("Apple, Banana, and Orange"), action:{} )
}
