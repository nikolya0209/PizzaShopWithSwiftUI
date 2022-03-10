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
        
        VStack {
            List(viewModel.positions) { position in
                PositionCell(position: position)
            }
            .listStyle(.plain)
            .navigationTitle("Корзина")
            
            HStack {
                Text("Итого:")
                    .fontWeight(.bold)
                Spacer()
                Text("\(self.viewModel.cost) ₽")
                    .fontWeight(.bold)
            }.padding()
        }
    }
    
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel())
    }
}
