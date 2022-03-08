//
//  PositionCell.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 07.03.2022.
//

import SwiftUI

struct PositionCell: View {
    
    let position: Position
    
    var body: some View {
        
        HStack {
            Text(position.product.tittle)
                .fontWeight(.bold)
            Spacer()
            Text("\(position.count) шт.")
            Text("\(position.cost) ₽")
                .frame(width: 85, alignment: .trailing)
        }.padding(.horizontal)
        
        
    }
}

struct PositionCell_Previews: PreviewProvider {
    static var previews: some View {
        PositionCell(position: Position(id: UUID().uuidString, product: Product(id: UUID().uuidString, tittle: "Маргарита", imageURL: "pizzaPH", price: 335, descript: "afsafd"), count: 3))
    }
}
