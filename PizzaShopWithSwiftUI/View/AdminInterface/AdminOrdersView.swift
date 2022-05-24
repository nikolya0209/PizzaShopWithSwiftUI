//
//  AdminOrdersView.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 14.05.2022.
//

import SwiftUI

struct AdminOrdersView: View {
    
    @StateObject var viewModel = AdminOrdersViewModel()
    @State var isOrderViewShow = false
    
    var body: some View {
        List {
            ForEach(viewModel.orders, id: \.id) { order in
                OrderCell(order: order)
                    .onTapGesture {
                        isOrderViewShow.toggle()
                    }
            }
        }.listStyle(.plain)
            .onAppear {
                viewModel.getOrders()
            }
    }
}


struct AdminOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        AdminOrdersView()
    }
}
