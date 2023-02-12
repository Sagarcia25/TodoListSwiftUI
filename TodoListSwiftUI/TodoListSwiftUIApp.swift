//
//  TodoListSwiftUIApp.swift
//  TodoListSwiftUI
//
//  Created by Salvador Garcia on 2/12/23.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - data point
 View - UI
 ViewModel - manages Models for view
 
 
 */


@main
struct TodoListSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
        }
    }
}
