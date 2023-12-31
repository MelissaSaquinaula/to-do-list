//
//  ContentView.swift
//  to do list
//
//  Created by scholar on 8/1/23.
//

import SwiftUI
struct ContentView: View {
   
    @State var toDoItem : [ToDoItem] = []
    @State private var showNewTask = false
    
    var body: some View {
        VStack {
            
            
        HStack{
                
                Text("To Do List")
                    .font(.system(size: 40))
                    .fontWeight(.black)
            Spacer()
                
                Button(action: {
                    showNewTask = true
                })    {
                Text("+")
                        .font(.largeTitle)
                }
            }
                .padding()
            Spacer()
            
        }
      
        List {
            ForEach(toDoItem) { toDoItem in
                if toDoItem.isImportant == true {
                    Text("🚨🚨🚨 " + toDoItem.title)
                } else {
                    Text(toDoItem.title)
                }
                
            }
        }
        .listStyle(.plain)
        
        if showNewTask {
            NewToDoView(title: "", isImportant: false, toDoItems: $toDoItem, showNewTask: $showNewTask)
        }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
