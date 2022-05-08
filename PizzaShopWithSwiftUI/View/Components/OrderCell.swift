//
//  OrderCell.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 07.05.2022.
//

import SwiftUI

struct OrderCell: View {
    
    @State var order: Order = Order(userID: "", date: Date(), status: "")
    
    var body: some View {
        HStack {
            Text("\(order.date)")
            Text("\(order.cost)")
                .bold()
                .frame(width: 90)
            Text("\(order.status)")
                .frame(width: 100)
                .foregroundColor(.green)
        }
        
    }
}

struct OrderCell_Previews: PreviewProvider {
    static var previews: some View {
        OrderCell()
    }
}