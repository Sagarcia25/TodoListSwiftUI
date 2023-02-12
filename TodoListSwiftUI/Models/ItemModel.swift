//
//  ItemModel.swift
//  TodoListSwiftUI
//
//  Created by Salvador Garcia on 2/12/23.
//

import Foundation

struct ItemModel: Identifiable{
    let id:String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
