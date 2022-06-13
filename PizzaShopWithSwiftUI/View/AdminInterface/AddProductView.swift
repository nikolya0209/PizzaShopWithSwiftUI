//
//  AddProductView.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 10.06.2022.
//

import SwiftUI

struct AddProductView: View {
    
    @State private var showImagePicker = false
    @State private var image = UIImage(named: "pizzaPH")!
    @State private var title: String = ""
    @State private var price: Int? = nil
    @State private var descript: String = ""
    
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
            frame(maxWidth: .infinity, maxHeight: 600)
                .aspectRatio(contentMode: .fill)
                .onTapGesture {
                showImagePicker.toggle()
            }
            TextField("Название продукта", text: $title)
                .padding()
            TextField("Цена продукта", value: $price, format: .number)
                .padding()
            TextField("Описание продукта", text: $title)
                .padding()
        }
        .padding()
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(sourceType: .photoLibrary,
                        selectedImage: $image)
        }
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}
