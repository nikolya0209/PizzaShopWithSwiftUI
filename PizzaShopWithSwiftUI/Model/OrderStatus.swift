//
//  OrderStatus.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 02.05.2022.
//

import Foundation

enum OrderStatus: String, CaseIterable {
    case new = "Новый"
    case cooking = "Готовится"
    case delivery = "Доставляется"
    case completed = "Выполнен"
    case cancelled = "Отменен"
}
