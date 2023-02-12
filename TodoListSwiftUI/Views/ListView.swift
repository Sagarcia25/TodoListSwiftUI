//
//  ListView.swift
//  TodoListSwiftUI
//
//  Created by Salvador Garcia on 2/12/23.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = ["This is the first item","This is the second item","This is the third item", "This is the fourth item"]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
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


