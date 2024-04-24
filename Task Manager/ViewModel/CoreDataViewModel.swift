//
//  CoreDataViewModel.swift
//  Task Manager
//
//  Created by Vladyslav Dikhtiaruk on 23/04/2024.
//

import Foundation
import CoreData


class CoreDataViewModel : ObservableObject {
    private let viewContext = PersistenceController.shared.viewContext
    @Published var tasks: [TaskEntity] = []
    
    init() {
        fetchTasks()
    }
    
    func fetchTasks() {
        let request = NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
        request.fetchLimit = 10
        
        do {
            tasks = try viewContext.fetch(request)
        } catch {
            print("DEBUG: Some error occured while fetching: \(error.localizedDescription)")
            fatalError()
        }
    }
    
    func addTask(title: String, taskDescription: String, completed: Bool) {
        let newTask = TaskEntity(context: viewContext)
        newTask.title = title
        newTask.taskDescription = taskDescription
        newTask.completed = completed
        save()
        fetchTasks()
        print("Add")
    }
    
    func save() {
        do {
            try viewContext.save()
        } catch {
            print("Failed to save tasks: \(error.localizedDescription)")
            fatalError()
        }
    }
    
    func updateTask(task: TaskEntity, newTitle: String, newDescription: String) {
        task.title = newTitle
        task.taskDescription = newDescription
        save()
        fetchTasks()
    }
    
    func deleteTask(offsets: IndexSet) {
//        offsets.map { tasks[$0] }.forEach(viewContext.delete)
        guard let index = offsets.first else {
            return
        }
        let taskEntity = tasks[index]
        viewContext.delete(taskEntity)
        save()
        fetchTasks()
    }
    
}
