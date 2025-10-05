import SwiftUI

struct AddTaskView: View {
    @State var newTask: String = ""
    @EnvironmentObject var viewModel: TaskListViewModel
    @Environment(\.dismiss) var dismiss
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Enter a task", text: $newTask)
                    .padding(.horizontal)
                    .frame(height: 48)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    
                
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
    
    private func saveNewTask() {
        viewModel.saveNewTask(newTask)
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
