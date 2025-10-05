import SwiftUI

struct TaskCellView: View {
    let task: TaskModel
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ?  "checkmark.circle.fill" : "circle")
                .foregroundStyle(.red)
                .opacity(task.isCompleted ? 0.5 : 1.0)
            Text(task.title)
                .opacity(task.isCompleted ? 0.5 : 1.0)
        }
    }
}

#Preview {
    var tasks = [
        TaskModel(title: "get me a cuppa tea", isCompleted: false),
        TaskModel(title: "ow yeah", isCompleted: true)
    ]

    
    TaskCellView(task: tasks.first!)
}
