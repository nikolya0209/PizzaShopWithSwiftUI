//
//  PizzaShopWithSwiftUIApp.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 02.03.2022.
//

import SwiftUI

let screen = UIScreen.main.bounds

@main
struct PizzaShopWithSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
}
