//
//  AdminOrdersViewModel.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 16.05.2022.
//

import Foundation
class AdminOrdersViewModel: ObservableObject {
    @Published var orders = [Order]()
}
