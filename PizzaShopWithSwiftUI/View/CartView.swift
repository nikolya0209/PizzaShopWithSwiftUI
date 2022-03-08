//
//  CartView.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 05.03.2022.
//

import SwiftUI

struct CartView: View {
    
    var viewModel: CartViewModel
    
    var body: some View {
        Text("Корзина")
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel())
    }
}
