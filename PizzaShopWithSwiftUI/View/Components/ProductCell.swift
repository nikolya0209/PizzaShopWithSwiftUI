//
//  ProductCell.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 06.03.2022.
//

import SwiftUI

struct ProductCell: View {
    
    var product: Product
    
    var body: some View {
        VStack(spacing: 2) {
            Image("pizzaPH")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: screen.width * 0.45)
                .clipped()
                //.cornerRadius(16)
            
            HStack {
                Text(product.tittle)
                    .font(.custom("Aveni-Next-regular", size: 12))
                    
                    Spacer()
                Text("\(product.price)₽")
                    .font(.custom("Aveni-Bold", size: 12))
            }
            .padding(.horizontal, 6)
            .padding(.bottom, 6)
        }.frame(width: screen.width * 0.45, height: screen.width * 0.55)
            .background(.white)
            
            .shadow(radius: 4)
            
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: Product(id: "1",
                                     tittle: "Маргарита",
                                     imageURL: "Not Found",
                                     price: 450,
                                     descript: "Самая большая пицца"))
    }
}
