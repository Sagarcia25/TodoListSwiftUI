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
    @Published var items: [ItemModel] = [] {
        //Anytime items array is changed, didSet gets called
        didSet{
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
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
        guard let data = UserDefaults.standard.data(forKey: itemsKey),
              let savedItem = try? JSONDecoder().decode([ItemModel].self, from: data) else{
            return
        }
        items = savedItem
        
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
    func addItem(title: String){
            let newItem = ItemModel(title: title, isCompleted: false)
            items.append(newItem)
    }
    
    //Use UserDefaults over @AppStorage because we are in a class
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
