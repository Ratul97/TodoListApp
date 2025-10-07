import Foundation

struct TaskModel: Identifiable, Codable {
    var id = UUID()
    let title: String
    let details: String?
    let isCompleted: Bool
    let priority: TaskPriority
    let date: String
    
    enum TaskPriority: String, Codable, CaseIterable {
        case low, medium, high
    }
    
    init(title: String, details: String?, isCompleted: Bool, priority: TaskPriority, date: String) {
        self.title = title
        self.details = details
        self.isCompleted = isCompleted
        self.priority = priority
        self.date = date
    }
    
    func updateTask() -> Self {
        return TaskModel(title: title, details: details, isCompleted: !isCompleted, priority: priority, date: date)
    }
}
