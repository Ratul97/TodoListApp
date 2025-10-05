import Foundation

struct TaskModel: Identifiable, Codable {
    var id = UUID()
    let title: String
    let isCompleted: Bool
    
    init(title: String, isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateTask() -> Self {
        return TaskModel(title: title, isCompleted: !isCompleted)
    }
}
