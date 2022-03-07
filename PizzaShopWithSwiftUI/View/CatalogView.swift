//
//  Catalog.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 05.03.2022.
//

import SwiftUI

struct CatalogView: View {
    
    let layout = [GridItem(.adaptive(minimum: screen.width / 2.4))]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Section("Популярное") {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: layout, spacing: 16) {
                        ForEach(CatalogViewModel.shared.popularproducts, id: \.id) { item in
                            NavigationLink {
                                let viewModel = ProductDetailViewModel(product: item)
                                ProductDetailView(viewModel: viewModel)
                            } label: {
                                ProductCell(product: item)
                                    .foregroundColor(.black)
                            }

                            
                        }
                    }.padding()
                }
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                Section("Пицца") {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: layout, spacing: 16) {
                            ForEach(CatalogViewModel.shared.pizza, id: \.id) { item in
                                NavigationLink {
                                    let viewModel = ProductDetailViewModel(product: item)
                                    ProductDetailView(viewModel: viewModel)
                                } label: {
                                    ProductCell(product: item)
                                        .foregroundColor(.black)
                                }
                            }
                        }.padding()
                    }
                }
            }.navigationBarTitle(Text("Каталог"))
            
            
        }
    }
}

struct Catalog_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
