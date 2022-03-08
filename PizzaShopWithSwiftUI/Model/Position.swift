//
//  Position.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 07.03.2022.
//

import Foundation

struct Position: Identifiable {
    var id: String
    var product: Product
    var count: Int
    
    var cost: Int {
        return product.price * self.count
    }
}
