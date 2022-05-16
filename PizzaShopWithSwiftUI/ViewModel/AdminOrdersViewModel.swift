//
//  AdminOrdersViewModel.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 16.05.2022.
//

import Foundation
class AdminOrdersViewModel: ObservableObject {
    @Published var orders = [Order]()
    
    func getOrders() {
        DatabaseService.shared.getOrders(by: nil) { result in
            switch result {
            case .success(let orders):
                self.orders = orders
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
