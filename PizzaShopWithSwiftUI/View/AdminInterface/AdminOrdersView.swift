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
    @State var isShowAuthView = false
    
    var body: some View {
        
        VStack {
            
            Button {
                AuthService.shared.signOut()
                isShowAuthView.toggle()
            } label: {
                Text("Выход")
            }

            
            List {
                ForEach(viewModel.orders, id: \.id) { order in
                    OrderCell(order: order)
                        .onTapGesture {
                            viewModel.currentOrder = order
                            isOrderViewShow.toggle()
                        }
                }
            }.listStyle(.plain)
                .onAppear {
                    viewModel.getOrders()
                }
                .sheet(isPresented: $isOrderViewShow) {
                    let orderViewModel = OrderViewModel(order: viewModel.currentOrder)
                    OrderView(viewModel: orderViewModel)
                }
            
        }.fullScreenCover(isPresented: $isShowAuthView) {
            AuthView()
        }
        
    }
}


struct AdminOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        AdminOrdersView()
    }
}
