//
//  OrderView.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 20.05.2022.
//

import SwiftUI

struct OrderView: View {
    @StateObject var viewModel: OrderViewModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            Text("\(viewModel.user.name)")
                .font(.title3).bold()
            Text("\(viewModel.user.phone)")
                .bold()
            Text("\(viewModel.user.adress)")
            List {
                ForEach(viewModel.order.positions, id: \.id) { position in
                    PositionCell(position: position)
                }
                Text("Итого: \(viewModel.order.cost) ₽")
                    .bold()
            }
        }.padding()
            .onAppear {
                viewModel.getUserData()
            }
       
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(viewModel: OrderViewModel(order: Order(userID: "", date: Date(), status: "Новый")))
    }
}