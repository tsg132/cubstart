//
//  ContentView.swift
//  Shopping List
//
//  Created by Tony Hong on 3/11/22.
//

import SwiftUI

class Item: Identifiable {
    let imageName: String
    let itemName: String
    let quantity: Int
    
    init(imageName: String, itemName: String, quantity: Int) {
        self.imageName = imageName
        self.itemName = itemName
        self.quantity = quantity
    }
}

struct ContentView: View {
    var fruits = [
        Item(imageName: "banana", itemName: "Bananas", quantity: 3),
        Item(imageName: "apple", itemName: "Apples", quantity: 4)
    ]
    var vegetables = [
        Item(imageName: "onions", itemName: "Onions", quantity: 2),
        Item(imageName: "peppers", itemName: "Peppers", quantity: 5)
    ]
    var dairy = [
        Item(imageName: "milk", itemName: "Milk", quantity: 1),
        Item(imageName: "yogurt", itemName: "Yogurt", quantity: 4)
    ]
    var other = [
        Item(imageName: "eggs", itemName: "Eggs", quantity: 12)
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Fruits")) {
                    ForEach(fruits) { i in
                        CustomCell(imageName: i.imageName, itemName: i.itemName, quantity: i.quantity)
                    }
                }
                Section(header: Text("Vegetables")) {
                    ForEach(vegetables) { i in
                        CustomCell(imageName: i.imageName, itemName: i.itemName, quantity: i.quantity)
                    }
                }
                Section(header: Text("Dairy")) {
                    ForEach(dairy) { i in
                        CustomCell(imageName: i.imageName, itemName: i.itemName, quantity: i.quantity)
                    }
                }
                Section(header: Text("Other")) {
                    ForEach(other) { i in
                        CustomCell(imageName: i.imageName, itemName: i.itemName, quantity: i.quantity)
                    }
                }
            }
            .navigationTitle("Shopping List")
        }
    }
}
