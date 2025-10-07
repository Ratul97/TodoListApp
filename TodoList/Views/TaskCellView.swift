import SwiftUI

struct TaskCellView: View {
    let task: TaskModel
    
    var imageName: String {
        switch task.priority {
        case .low:
            return "chevron.down.2"
        case .medium:
            return "chevron.compact.up.chevron.compact.down"
        case .high:
            return "chevron.up.2"
        }
    }
    
    var body: some View {
        HStack(spacing: 20) {
            checkMarkImageView
            
            taskInfoView
            
            Spacer()
        }
        .padding()
        .background(task.isCompleted ? Color.green.opacity(0.1) : Color.blue.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 16.0))
        .opacity(task.isCompleted ? 0.5 : 1.0)
    }
    
    private var checkMarkImageView: some View {
        Image(systemName: task.isCompleted ?  "checkmark.circle.fill" : "circle")
            .foregroundStyle(.red)
    }
    
    private var taskInfoView: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(task.title)
                .font(.body)
                .opacity(task.isCompleted ? 0.5 : 1.0)
            
            if let details = task.details, !details.isEmpty {
                Text(details)
                    .foregroundStyle(Color.secondary)
                    .font(.footnote)
            }
            
            HStack {
                Text(task.date)
                    .font(.body)
                    .foregroundStyle(.red)
                
                Spacer()
                
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 10, height: 10)
                
                Text(task.priority.rawValue)
                    .foregroundStyle(Color.yellow)
                    .font(.footnote.weight(.bold))
            }
        }
    }
}

#Preview {
    var tasks = [
        TaskModel(title: "get me a cuppa tea", details: "details", isCompleted: false, priority: .medium, date: "date"),
        TaskModel(title: "ow yeah", details: "details", isCompleted: true, priority: .high, date: "date")
    ]

    
    TaskCellView(task: tasks.first!)
}
