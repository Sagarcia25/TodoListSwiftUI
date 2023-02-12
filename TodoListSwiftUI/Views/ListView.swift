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
                //ListRowView(title: item.title)
                ListRowView(item: item)
            }
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
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView()
        }
    }
}


