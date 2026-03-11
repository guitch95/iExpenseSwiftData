//
//  ExpenseItem.swift
//  iExpenseSwiftData
//
//  Created by Guillaume Richard on 06/03/2026.
//

import Foundation
import SwiftData

@Model
class ExpenseItem {
    // No need of id because already given by SwiftData
    var name:  String
    var type: String
    var amount : Double
    
    init(name: String, type: String, amount: Double) {
        self.name = name
        self.type = type
        self.amount = amount
    }
}
