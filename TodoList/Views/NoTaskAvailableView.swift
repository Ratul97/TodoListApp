//
//  NoTaskAvailableView.swift
//  TodoList
//
//  Created by Kazi Shakawat Hossain Ratul on 27/9/25.
//

import SwiftUI

struct NoTaskAvailableView: View {
    @State var showAddTaskView: Bool = false
    @State var isAnimating: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "list.bullet.clipboard")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
                    .foregroundStyle(Color(.secondaryLabel))
                
                Text("No Tasks Yet")
                    .font(.title2.weight(.semibold))
                
                Text("Start adding tasks to get started!")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Button {
                    withAnimation {
                        showAddTaskView.toggle()
                    }
                } label: {
                    Text("Get Started")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal, isAnimating ? 24 : 16)
                        .padding(.vertical, isAnimating ? 14 : 12)
                        .background(isAnimating ? Color.red : Color.green)
                        .cornerRadius(8)
                        .scaleEffect(isAnimating ? 0.85 : 1.0)
                        .offset(y: isAnimating ? -10 : 0)
                        .shadow(color: isAnimating ? Color.red.opacity(0.3) : Color.green.opacity(0.3), radius: 4, x: 0, y: 8)
                }
                .padding()
                .onAppear(perform: animateButton)
            }
            .navigationDestination(isPresented: $showAddTaskView) {
                AddTaskView()
            }
        }
    }
    
    private func animateButton() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            if !isAnimating {
                withAnimation(
                    .easeInOut(duration: 2.0)
                    .repeatForever()
                ) {
                    isAnimating.toggle()
                }
            }
        })
    }
}

#Preview {
    NavigationStack {
        NoTaskAvailableView()
    }
}
