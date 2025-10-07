//
//  PriorityPickerView.swift
//  TodoList
//
//  Created by Kazi Shakawat Hossain Ratul on 6/10/25.
//

import SwiftUI

struct PriorityPickerView: View {
    @Binding var selection: TaskModel.TaskPriority
    
    var body: some View {
        Picker(selection: $selection) {
            ForEach(TaskModel.TaskPriority.allCases, id: \.self) { priority in
                Text(priority.rawValue).tag(priority)
            }
            
        } label: {
            HStack {
                Text(selection.rawValue)
            }
        }
        .pickerStyle(MenuPickerStyle())
        .tint(.red)

    }
}

#Preview {
    PriorityPickerView(selection: .constant(.low))
}
