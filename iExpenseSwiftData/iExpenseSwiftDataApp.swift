//
//  iExpenseSwiftDataApp.swift
//  iExpenseSwiftData
//
//  Created by Guillaume Richard on 06/03/2026.
//

import SwiftUI
import SwiftData

@main
struct iExpenseSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
