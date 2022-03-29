//
//  MainTabBarViewModel.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 29.03.2022.
//

import Foundation
import FirebaseAuth

class MainTabBarViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}
