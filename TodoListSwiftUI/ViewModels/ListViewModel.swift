//
//  ListViewModel.swift
//  TodoListSwiftUI
//
//  Created by Salvador Garcia on 2/13/23.
//

import Foundation

class ListViewModel: ObservableObject{
    @Published var items: [ItemModel] = []
    
    init(){
        getItem()
    }
    
    func delete(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func move(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func getItem(){
        let newItems = [
            ItemModel(title: "This is the first item", isCompleted: false),
            ItemModel(title: "This is the second item", isCompleted: true),
            ItemModel(title: "This is the third item", isCompleted: false)
            ]
        items.append(contentsOf: newItems)
    }
}
