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
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                ForEach(viewModel.tasks.indices, id: \.self) { taskIndex in
                    NavigationLink {
                        TaskDetailView(task: viewModel.tasks[taskIndex], vm: viewModel)
                    } label: {
                        TaskView(task: viewModel.tasks[taskIndex], index: taskIndex) {
                            withAnimation(.snappy) {
                                viewModel.deleteTask(task: viewModel.tasks[taskIndex])
                            }
                        }
                    }
                    .padding(.vertical, 0)
                }
            }
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        show = true
                    }, label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 34, height: 34)
                            .foregroundStyle(.green)
                    })
                }
            }
            .sheet(isPresented: $show){
                AddTaskView(show: $show, inputTitle: $inputTitle, inputDescription: $inputDescription) {
                    withAnimation {
                        if(inputTitle.isEmpty){
                            print("Fill in title...")
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
        .preferredColorScheme(.dark)
    }
        
    }
    
    #Preview {
        ContentView(viewModel: CoreDataViewModel())
    }
