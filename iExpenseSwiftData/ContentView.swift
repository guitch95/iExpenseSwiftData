//
//  ContentView.swift
//  iExpenseSwiftData
//
//  Created by Guillaume Richard on 06/03/2026.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var showingAddExpense = false
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount),
    ]
    @State private var expenseType = "All"
    var body: some View {
        NavigationStack {
            ExpensesView(
                type: expenseType,
                sortOrder: sortOrder
            )
            .navigationTitle("iExpense")
            .toolbar {
                // "Add Expense" n'apparait pas dans notre UI mais utile pour l'accessibilité.
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
                Menu("Filter", systemImage: "line.3.horizontal.decrease.circle")
                {
                    Picker("Filter", selection: $expenseType) {
                        Text("Show All Expenses").tag("All")
                        // On peut loop directement sur les Types car c'est une propriété static.
                        ForEach(AddView.types, id: \.self) { type in
                            Text(type).tag(type)
                        }

                    }
                }
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Name A-Z")
                            .tag([
                                SortDescriptor(\ExpenseItem.name),
                                SortDescriptor(\ExpenseItem.amount),
                            ])

                        Text("Name Z-A")
                            .tag([
                                SortDescriptor(
                                    \ExpenseItem.name,
                                    order: .reverse
                                ),
                                SortDescriptor(\ExpenseItem.amount),
                            ])

                        Text("Amount (Cheapest First)")
                            .tag([
                                SortDescriptor(\ExpenseItem.amount),
                                SortDescriptor(\ExpenseItem.name),

                            ])

                        Text("Amount (Most Expensive First)")
                            .tag([
                                SortDescriptor(
                                    \ExpenseItem.amount,
                                    order: .reverse
                                ),
                                SortDescriptor(\ExpenseItem.name),

                            ])

                    }
                }
                .sheet(isPresented: $showingAddExpense) {
                    AddView()
                        .presentationDetents([.medium])
                }

            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ExpenseItem.self)

}
