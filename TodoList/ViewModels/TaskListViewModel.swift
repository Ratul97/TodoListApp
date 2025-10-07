import Foundation

class TaskListViewModel: ObservableObject {
    @Published var tasks: [TaskModel] = [] {
        didSet {
            saveData()
        }
    }
    private let tasksKey = "tasks"
    
    init() {
        getTasks()
    }
    
    func getTasks() {
        guard
            let savedData = UserDefaults.standard.data(forKey: tasksKey),
            let savedTasks = try? JSONDecoder().decode([TaskModel].self, from: savedData)
        else { return }
        
        tasks = savedTasks
    }
    
    func onDelete(_ indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    
    func onMove(_ indexSet: IndexSet, index: Int) {
        tasks.move(fromOffsets: indexSet, toOffset: index)
    }
    
    func saveNewTask(_ title: String, _ taskDetails: String?, _ taskPriority: TaskModel.TaskPriority, _ date: String) {
        tasks.append(TaskModel(title: title, details: taskDetails, isCompleted: false, priority: taskPriority, date: date))
    }
    
    func updateTask(_ task: TaskModel) {
        if let itemIndex = tasks.firstIndex(where: { $0.id == task.id}) {
            tasks[itemIndex] = tasks[itemIndex].updateTask()
        }
    }
    
    func saveData() {
        guard let tasksData = try? JSONEncoder().encode(tasks) else { return }
        UserDefaults.standard.set(tasksData, forKey: tasksKey)
    }
}
