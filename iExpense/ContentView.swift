//
//  ContentView.swift
//  iExpense
//
//  Created by Michael Pedigo on 6/11/2025.
//

import SwiftUI


struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var navigateToAddExpense = false


    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }


                        Spacer()


                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        navigateToAddExpense = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .background(
                NavigationLink(
                    "",
                    destination: AddView(expenses: expenses),
                    isActive: $navigateToAddExpense
                )
                .opacity(0) // Hide link
            )
        }
    }


    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}


#Preview {
    ContentView()
}
