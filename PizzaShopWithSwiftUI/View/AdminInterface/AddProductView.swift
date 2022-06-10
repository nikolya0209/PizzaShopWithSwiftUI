//
//  AddProductView.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 10.06.2022.
//

import SwiftUI

struct AddProductView: View {
    
    @State private var showImagePicker = false
    @State private var image = UIImage()
    
    var body: some View {
        VStack {
            Image("bg").onTapGesture {
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
