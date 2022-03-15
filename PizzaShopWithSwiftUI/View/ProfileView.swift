//
//  ProfileView.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 05.03.2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
        
        HStack(spacing: 16) {
            Image("user")
                .resizable()
                .frame(width: 80, height: 80)
                .padding(8)
                .background(Color("lightGray"))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Владислав Иванович")
                    .bold()
                Text("+7 329 23 322 23")
            }
        }
            
            VStack(alignment: .leading, spacing: 2) {
            Text("Адрес доставки: ")
                .bold()
            Text("Беларусь, г. Гродно, ул. Василька, дом 9")
            }
            List{
                
            }.listStyle(.plain)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
