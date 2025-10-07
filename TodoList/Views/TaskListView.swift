//
//  TaskListView.swift
//  TodoList
//
//  Created by Kazi Shakawat Hossain Ratul on 10/8/25.
//

import SwiftUI

struct TaskListView: View {
    @EnvironmentObject var viewModel: TaskListViewModel
    
    var body: some View {
        ZStack {
            if viewModel.tasks.isEmpty {
                NoTaskAvailableView()
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            } else {
                List {
                    ForEach(viewModel.tasks) { task in
                        Button {
                            withAnimation(.default.delay(0.2)) {
                                viewModel.updateTask(task)
                            }
                        } label: {
                            TaskCellView(task: task)
                        }
                        .listRowSeparator(.hidden)
                    }
                    .onDelete(perform: viewModel.onDelete)
                    .onMove(perform: viewModel.onMove)
                }
                .listStyle(.plain)
                .padding(.vertical)
                .navigationTitle(Text("Tasks"))
                .navigationBarItems(leading: EditButton(), trailing: NavigationLink(
                    "Add",
                    destination: AddTaskView())
                )
                .tint(.red)
            }
        }
    }
}

#Preview {
    NavigationView {
        TaskListView()
    }
    .environmentObject(TaskListViewModel())
}
