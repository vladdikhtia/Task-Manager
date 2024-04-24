//
//  TaskDetailView.swift
//  Task Manager
//
//  Created by Vladyslav Dikhtiaruk on 24/04/2024.
//

import SwiftUI

struct TaskDetailView: View {
    var task: TaskEntity
    @State private var newTitle: String = ""
    @State private var newDescription: String = ""
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm: CoreDataViewModel
    
    var body: some View {
        VStack(spacing: 30){
            TextField("\(task.title ?? " ") ", text: $newTitle) // \(task.title ?? " ")
                .padding()
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal)
                .shadow(color: .white, radius: 8)
                .font(.subheadline)
                .fontWeight(.semibold)
            
            TextField("\(task.taskDescription ?? " ") ", text: $newDescription) // \(task.title ?? " ")
                .padding()
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal)
                .shadow(color: .white, radius: 8)
                .font(.subheadline)
                .fontWeight(.semibold)
             
            
            Button(
                action: {
                    vm.updateTask(task: task, newTitle: newTitle, newDescription: newDescription)
                    dismiss()
                }, label: {
                    Text("Update")
                        .padding()
                        .foregroundStyle(.green)
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .background(.black)
                        .clipShape(.rect(cornerRadius: 10))
                        .shadow(color: .white, radius: 10)
                        .padding()
                })
            
            Spacer()
        }
        .toolbar{
            ToolbarItem{
                ShareLink("Share your task", item: "\(task.title ?? "") \n\(task.taskDescription ?? "")")   
            }
            
            ToolbarItem {
                Button(action: {
                    withAnimation {
                        vm.deleteTask(task: task)
                        dismiss()
                    } 
                }, label: {
                    Image(systemName: "trash")
                        .resizable()
                        .imageScale(.large)
                        .foregroundStyle(.red)
                })
            }
        }
        
        
    }
}

//#Preview {
//    TaskDetailView(action: .constant {
//        
//    })
//}
