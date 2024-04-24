//
//  ContentView.swift
//  Task Manager
//
//  Created by Vladyslav Dikhtiaruk on 23/04/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @StateObject var viewModel = CoreDataViewModel()
    @State private var show = false
    @State private var inputTitle = ""
    @State private var inputDescription = ""
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.tasks, id: \.self) { task in
                    NavigationLink {
                        Text("Task at \(task.title ?? "b")")
                    } label: {
                        Text(task.title ?? "b")
                    }
                }
                .onDelete(perform: viewModel.deleteTask)
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: {
                        show = true
                    }, label: {
                        Text("Add")
                    })
                }
            }
            .sheet(isPresented: $show){
                AddTaskView(show: $show, inputTitle: $inputTitle, inputDescription: $inputDescription) {
                    withAnimation {
                        if(inputTitle.isEmpty){
                            showAlert = true
                        } else{
                            viewModel.addTask(title: inputTitle, taskDescription: inputDescription, completed: false)
                        show.toggle()
                        }
                    }
                }
                .presentationDetents([.fraction(0.45)])
                .presentationDragIndicator(.visible)
            }
            
            .navigationTitle("Task Manager")
        }
    }
        
    }
    
    #Preview {
        ContentView(viewModel: CoreDataViewModel())
    }
