//
//  TaskView.swift
//  QuickToDoList
//
//  Created by Patrick Serrano on 2/19/22.
//

import SwiftUI

struct TasksView: View {
    @EnvironmentObject var realmManager: RealmManager
    
    var body: some View {
        VStack {
            Text("To Do List")
                .font(.title2)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            	if (realmManager.tasks.isEmpty) {
                Text("Click the + to add a new to do")
                    .font(.subheadline)
            }
            
            List {
                ForEach(realmManager.tasks, id:\.id) { task in
                    if(!task.isInvalidated) {
                        TaskRow(task: task.title, completed: task.completed)
                            .onTapGesture {
                                realmManager.updateTask(id: task.id, completed: !task.completed)
                            }
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    realmManager.deleteTask(id: task.id)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                    }
                }
                .listRowSeparator(.hidden)
            }.onAppear {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(RealmManager())
    }
}
