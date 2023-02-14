//
//  ItemModel.swift
//  TodoListSwiftUI
//
//  Created by Salvador Garcia on 2/12/23.
//

import Foundation

struct ItemModel: Identifiable, Codable{
    let id:String
    let title: String
    let isCompleted: Bool
    
    //added a custom init to add the id parameter
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel{
        return ItemModel(id: id,title: title, isCompleted: !isCompleted)
    }
}
