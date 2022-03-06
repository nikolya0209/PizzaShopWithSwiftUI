//
//  ProductDetailView.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 06.03.2022.
//

import SwiftUI

struct ProductDetailView: View {
    
    var product: Product
    
    var body: some View {
        Text("\(product.tittle)")
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product(id: "1",
                                           tittle: "Маргарита",
                                           imageURL: "Not Found",
                                           price: 450,
                                           descript: "Самая большая пицца"))
    }
}
