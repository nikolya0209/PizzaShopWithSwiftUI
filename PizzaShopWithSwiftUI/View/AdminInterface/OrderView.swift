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
            Text("Вася Пупкин")
                .font(.title3).bold()
            Text("+7 998887766")
                .bold()
            Text("Улица Пушкина, 7")
            List {
                ForEach(viewModel.order.positions, id: \.id) { position in
                    PositionCell(position: position)
                }
            }
        }.padding()
        
       
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(viewModel: OrderViewModel(order: Order(userID: "", date: Date(), status: "Новый")))
    }
}
