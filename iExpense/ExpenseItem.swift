//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Michael Pedigo on 11/24/25.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

