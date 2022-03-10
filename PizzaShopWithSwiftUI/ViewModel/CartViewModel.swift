//
//  CartViewModel.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 07.03.2022.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var positions = [Position]()
    
    var cost: Int {
        var sum = 0
        
        for pos in positions {
            sum += pos.cost
        }
        return sum
    }
    
    func addPosition(_ position: Position) {
        self.positions.append(position)
    }
}
