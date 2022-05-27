//
//  OrderViewModel.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 20.05.2022.
//

import Foundation

class OrderViewModel: ObservableObject {
    @Published var order: Order
    @Published var user = MvUser(id: "", name: "", phone: 0, adress: "")
    init(order: Order) {
        self.order = order 
    }
    
    func getUserData() {
        DatabaseService.shared.getProfile(by: order.userID) { result in
            switch result {
                
            case .success(let user):
                self.user = user
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
