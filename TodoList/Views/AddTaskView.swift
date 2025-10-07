import SwiftUI

struct AddTaskView: View {
    @State var newTask: String = ""
    @State var taskDetails: String = ""
    @State var taskDate: Date = Date()
    @State var taskPriority: TaskModel.TaskPriority = .low
    @EnvironmentObject var viewModel: TaskListViewModel
    @Environment(\.dismiss) var dismiss
    @State var showAlert: Bool = false
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                TextField("Enter Title", text: $newTask)
                    .font(.title2)
                
                showLabelWithImageView(imageString: "list.dash.header.rectangle", placeholder: "Add details", text: $taskDetails)
                HStack(spacing: 16) {
                    Image(systemName: "clock")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .foregroundStyle(Color.gray)
                    
                    DatePickerView(date: $taskDate)
                }
                
                HStack {
                    Text("Select Priority :")
                        .foregroundStyle(Color.secondary)
                    
                    PriorityPickerView(selection: $taskPriority)
                    
                }
                saveButtonView
            }
            .padding()
        }
        .navigationTitle("Add new task")
        .navigationBarTitleDisplayMode(.large)
        .alert("Unable to add task", isPresented: $showAlert) {
            Button("Cancel", role: .cancel, action: { })
        } message: {
            Text("Please enter a valid task name.")
        }
    }
    
    private var saveButtonView: some View {
        Button {
            if isTaskValid() {
                saveNewTask()
                dismiss()
            } else {
                showAlert.toggle()
            }
        } label: {
            Text("Save")
                .frame(height: 48)
                .frame(maxWidth: .infinity)
                .background(.red)
                .foregroundStyle(.white)
                .cornerRadius(10)
        }
    }
    
    private func showLabelWithImageView(imageString: String, placeholder: String, text: Binding<String>) -> some View {
        HStack (spacing: 16){
            Image(systemName: imageString)
                .resizable()
                .scaledToFit()
                .frame(width: 20)
                .foregroundStyle(Color.gray)
            
            TextField(placeholder, text: text)
                .font(Font.callout)
        }
    }
    
    private func saveNewTask() {
        viewModel.saveNewTask(newTask, taskDetails, taskPriority, dateFormatter.string(from: taskDate))
    }
    
    func isTaskValid() -> Bool {
        return !newTask.isEmpty
    }
}

#Preview {
    NavigationView {
        AddTaskView()
    }
    .environmentObject(TaskListViewModel())
}
