//
//  OrderViewModel.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 20.05.2022.
//

import Foundation

class OrderViewModel: ObservableObject {
    @Published var order: Order
    
    init(order: Order) {
        self.order = order 
    }
    
}
