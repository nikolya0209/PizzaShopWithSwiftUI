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
            Text("Добавить товар")
                .font(.title2.bold())
            Image(uiImage: image)
                .resizable()
                .frame(maxWidth: .infinity, minHeight: 300, maxHeight: 320)
                .aspectRatio(contentMode: .fit)
                .onTapGesture {
                showImagePicker.toggle()
            }
                .cornerRadius(24)
            TextField("Название продукта", text: $title)
                .padding()
            TextField("Цена продукта", value: $price, format: .number)
                .padding()
            TextField("Описание продукта", text: $title)
                .padding()
            Button {
                print("Сохранить")
            } label: {
                Text("Сохранить")
                    .padding()
                    .padding(.horizontal, 30)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(16)
            }
            Spacer()
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
