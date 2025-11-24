//
//  AddView.swift
//  iExpense
//
//  Created by Michael Pedigo on 6/11/2025.
//

import SwiftUI


struct AddView: View {
    @Environment(\.dismiss) var dismiss


    var expenses: Expenses


    @State private var name = ""      // ← This is now the navigation title text
    @State private var type = "Personal"
    @State private var amount = 0.0


    let types = ["Business", "Personal"]


    var body: some View {
        Form {
            Picker("Type", selection: $type) {
                ForEach(types, id: \.self) {
                    Text($0)
                }
            }


            TextField("Amount", value: $amount, format: .currency(code: "USD"))
                .keyboardType(.decimalPad)
        }
        .toolbar {
            // ✏️ Editable navigation title
            ToolbarItem(placement: .principal) {
                TextField("Expense Name", text: $name)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
            }


            // 💾 Save button
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
                .disabled(name.isEmpty) // Don’t allow empty title
            }
        }
    }
}
