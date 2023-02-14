//
//  ListViewModel.swift
//  TodoListSwiftUI
//
//  Created by Salvador Garcia on 2/13/23.
//

import Foundation

/*
 CRUD FUNCTIONS
 
 CREATE
 READ
 UPDATE
 DELETE
 
 */


class ListViewModel: ObservableObject{
    @Published var items: [ItemModel] = []
    
    init(){
        getItem()
    }
    
    //MARK: - ListView Functions
    
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
    
    func updateItem(item: ItemModel){
//        if let index = items.firstIndex { existingItem in
//            return existingItem.id == item.id
//        }{
//
//        }
        
        if let index = items.firstIndex(where: { $0.id == item.id }){
            items[index] = item.updateCompletion()
        }
    }
    
    //MARK: - AddView functions
    func saveItem(title: String){
            let newItem = ItemModel(title: title, isCompleted: false)
            items.append(newItem)
    }
}
