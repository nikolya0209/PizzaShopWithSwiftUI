//
//  Order.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 30.04.2022.
//

import Foundation

struct Order {
    var id: String = UUID().uuidString
    var eserID: String
    var positions = [Position]()
    var date: Date
    var status: String
    
    var cost: Int {
        var sum = 0
        for position in positions {
            sum += position.cost
        }
        return sum
    }
}
