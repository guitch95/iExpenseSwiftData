//
//  ExpensesView.swift
//  iExpenseSwiftData
//
//  Created by Guillaume Richard on 06/03/2026.
//

import SwiftData
import SwiftUI

struct ExpensesView: View {
    @Query private var expenses: [ExpenseItem]
    @Environment(\.modelContext) var modelContext
    let localCurrency =
        Locale.current.currency?.identifier
        ?? "USD"
    var body: some View {
        List {
            ForEach(expenses) { item in
                HStack {
                    VStack {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }
                    Spacer()

                    Text(
                        item.amount,
                        format: .currency(
                            code: localCurrency
                        )
                    )
                    .style(for: item)

                }
            }
            .onDelete(perform: removeItems)
        }

    }

    init(type: String = "All", sortOrder: [SortDescriptor<ExpenseItem>]) {
        _expenses = Query(
            // Pas de else if dans les Predicate ça pose problème.
            filter: #Predicate<ExpenseItem> {
                type == "All" ? true : $0.type == type
                //                if searchString == "All" {
                //                    return true
                //                } else {
                //                    return $0.type == searchString
                //                }
            },
            sort: sortOrder
        )
    }

    func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            modelContext.delete(expenses[offset])
        }

    }
}

#Preview {
    ExpensesView(
        type: "Business",
        sortOrder: [SortDescriptor(\ExpenseItem.name)]
    )
    .modelContainer(for: ExpenseItem.self)
}
