//
//  CartViewModel.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 07.03.2022.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var positions = [Position]()
    
    func addPosition(_ position: Position) {
        self.positions.append(position)
    }
}
