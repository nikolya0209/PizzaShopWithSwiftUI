//
//  ProductDetailViewModel.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 07.03.2022.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    @Published var product: Product
    @Published var sizes = ["Маленькая", "Средняя", "Большая"]
    
    init(product: Product) {
        self.product = product
    }
    
}
