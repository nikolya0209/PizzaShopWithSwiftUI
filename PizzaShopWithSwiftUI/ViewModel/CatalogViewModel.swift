//
//  CatalogViewModel.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 06.03.2022.
//

import Foundation

class CatalogViewModel: ObservableObject {
    
    static let shared = CatalogViewModel()
    
    var popularproducts = [
        Product(id: "1",
                                     tittle: "Маргарита",
                                     imageURL: "Not Found",
                                     price: 450,
                                     descript: "Самая большая пицца"),
        Product(id: "2",
                                     tittle: "Пеперони",
                                     imageURL: "Not Found",
                                     price: 350,
                                     descript: "Самая большая пицца"),
        Product(id: "3",
                                     tittle: "Гавайская",
                                     imageURL: "Not Found",
                                     price: 400,
                                     descript: "Самая большая пицца"),
        Product(id: "4",
                                     tittle: "Четыре сыра",
                                     imageURL: "Not Found",
                                     price: 650,
                                     descript: "Самая большая пицца"),
        Product(id: "4",
                                     tittle: "Домашняя",
                                     imageURL: "Not Found",
                                     price: 550,
                                     descript: "Самая большая пицца")
        
    ]
    
    var pizza = [
        Product(id: "1",
                                     tittle: "Маргарита",
                                     imageURL: "Not Found",
                                     price: 450,
                                     descript: "Самая большая пицца"),
        Product(id: "2",
                                     tittle: "Пеперони",
                                     imageURL: "Not Found",
                                     price: 350,
                                     descript: "Самая большая пицца"),
        Product(id: "3",
                                     tittle: "Гавайская",
                                     imageURL: "Not Found",
                                     price: 400,
                                     descript: "Самая большая пицца"),
        Product(id: "4",
                                     tittle: "Четыре сыра",
                                     imageURL: "Not Found",
                                     price: 650,
                                     descript: "Самая большая пицца"),
        Product(id: "4",
                                     tittle: "Домашняя",
                                     imageURL: "Not Found",
                                     price: 550,
                                     descript: "Самая большая пицца")
        
    ]
    
}
