//
//  ViewExpenseStyle.swift
//  iExpenseSwiftData
//
//  Created by Guillaume Richard on 06/03/2026.
//

import Foundation
import SwiftUI

extension View {
    func style(for item: ExpenseItem) -> some View {
        if item.amount < 10 {
            return self.font(.body)
        } else if item.amount < 100 {
            return self.font(.title3)
        } else {
            return self.font(.title)
        }
    }
}
