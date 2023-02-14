//
//  ListViewModel.swift
//  TodoListSwiftUI
//
//  Created by Salvador Garcia on 2/13/23.
//

import Foundation

class ListViewModel: ObservableObject{
    @Published var items: [ItemModel] = [
        ItemModel(title: "This is the first item", isCompleted: false),
        ItemModel(title: "This is the second item", isCompleted: true),
        ItemModel(title: "This is the third item", isCompleted: false)
        ]
    
    func delete(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func move(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
}
