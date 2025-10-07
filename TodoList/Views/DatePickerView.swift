//
//  DatePickerView.swift
//  TodoList
//
//  Created by Kazi Shakawat Hossain Ratul on 7/10/25.
//

import SwiftUI

struct DatePickerView: View {
    @Binding var date: Date
    
    var body: some View {
        DatePicker("Select a date ", selection: $date, displayedComponents: [.date])
            .foregroundStyle(.placeholder)
            .tint(.red)
    }
}

#Preview {
    DatePickerView(date: .constant(Date()))
}
