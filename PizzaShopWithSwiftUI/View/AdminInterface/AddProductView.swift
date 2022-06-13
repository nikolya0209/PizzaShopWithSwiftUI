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
    
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
            frame(maxWidth: .infinity, maxHeight: 600)
                .aspectRatio(contentMode: .fill)
                .onTapGesture {
                showImagePicker.toggle()
            }
        }
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
