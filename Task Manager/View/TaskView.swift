//
//  TaskView.swift
//  Task Manager
//
//  Created by Vladyslav Dikhtiaruk on 24/04/2024.
//

import SwiftUI

struct TaskView: View {
    
    var task: TaskEntity
    let index: Int
    let onDelete: () -> Void
    let randomColor = Color(
        .sRGB,
        red: Double.random(in: 0.5...1),
        green: Double.random(in: 0.5...1),
        blue: Double.random(in: 0.5...1),
        opacity: 1
    )
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .padding(.horizontal, 30)
                .padding(.vertical, 20)
                .foregroundStyle(randomColor)
                .frame(maxWidth: .infinity, maxHeight: 250)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("\(task.title ?? "")")
                        .font(.title)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                        .foregroundStyle(.background)
                
                Text("\(task.taskDescription ?? "")")
                    .font(.headline)
                    .fontDesign(.rounded)
                    .foregroundStyle(.background)
                
                HStack(alignment: .center) {
                    Button(action: onDelete) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                            .imageScale(.medium)
                            .padding()
                            .frame(width: 50, height: 50)
                            .background(.thickMaterial)
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                    
                        Image(systemName: "greaterthan")
                            .resizable()
                            .imageScale(.medium)
                            .foregroundStyle(.white)
                            .padding()
                            .frame(width: 50, height: 50)
                            .background(.thickMaterial)
                            .clipShape(Circle())
                    
                }
                
            }
            .padding(50)
            .frame(maxWidth: .infinity, maxHeight: 250, alignment: .topLeading)
        }
        .rotationEffect(.degrees(rotationDegree))
    }
    
    var rotationDegree: Double {
            let degree: Double
            if index % 2 == 0 {
                degree = .random(in: 0...15)
            } else {
                degree = .random(in: -15...0)
            }
            return degree
        }
}

//#Preview {
//    TaskView(task: )
//}
