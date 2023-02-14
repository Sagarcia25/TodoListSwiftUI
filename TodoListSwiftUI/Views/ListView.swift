//
//  ListView.swift
//  TodoListSwiftUI
//
//  Created by Salvador Garcia on 2/12/23.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
    ItemModel(title: "This is the first item", isCompleted: false),
    ItemModel(title: "This is the second item", isCompleted: true),
    ItemModel(title: "This is the third item", isCompleted: false)
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
            .onDelete(perform: delete)
            .onMove(perform: move)
        }
        .navigationTitle("Todo List 📝")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add", destination: AddView())
            }
        }
    }
    
    func delete(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func move(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView()
        }
    }
}


