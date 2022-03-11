//
//  ProductDetailView.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 06.03.2022.
//

import SwiftUI

struct ProductDetailView: View {
    
    @StateObject var viewModel: ProductDetailViewModel
    @State var size = "Маленькая"
    @State var count = 1
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Image("pizzaPH")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 260)
                    //.aspectRatio(contentMode: .)
                HStack {
                    Text("\(viewModel.product.tittle)")
                        .font(.title2.bold())
                    
                    Spacer()
                    Text("\(viewModel.getPrice(size: self.size)) ₽")
                        .font(.title2)
                }.padding(.horizontal)
                Text("\(viewModel.product.descript)")
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                
                HStack {
                    Stepper("Количество", value: $count, in: 1...10)
                    Text("\(self.count)")
                        .padding(.leading, 32)
                }.padding(.horizontal)
                
                Picker("Размер пиццы", selection: $size) {
                    ForEach(viewModel.sizes, id: \.self) { item in
                        Text(item)
                    }
                }.pickerStyle(.segmented)
                    .padding()
                
                
            }
            Button {
                let position = Position(id: UUID().uuidString,
                                        product: viewModel.product,
                                        count: self.count)
                CartViewModel.shared.addPosition(position)
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("В корзину!")
                    .padding()
                    .padding(.horizontal, 60)
                    .foregroundColor(Color("darkBrown"))
                    .font(.title3.bold())
                    .background(LinearGradient(colors: [Color("yellow"), Color("orange")], startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(20)
            }

            Spacer()
        }
        
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewModel: ProductDetailViewModel(product: Product(id: "4",
                                                                             tittle: "Домашняя",
                                                                             imageURL: "Not Found",
                                                                             price: 550,
                                                                             descript: "Самая большая пицца")))
    }
}
