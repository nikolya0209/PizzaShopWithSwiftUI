//
//  MvUser.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 30.03.2022.
//

import Foundation

struct MvUser: Identifiable {
    var id: String
    var name: String
    var phone: Int
    var adress: String
    
    var representation: [String: Any] {
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["name"] = self.name
        repres["phone"] = self.phone
        repres["adress"] = self.adress
        
        return repres
    }
    
     
}
