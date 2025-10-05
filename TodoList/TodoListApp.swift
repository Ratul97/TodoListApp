//
//  TodoListApp.swift
//  TodoList
//
//  Created by Kazi Shakawat Hossain Ratul on 10/8/25.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject private var taskListViewModel = TaskListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                TaskListView()
            }
            .environmentObject(taskListViewModel)
        }
    }
}
