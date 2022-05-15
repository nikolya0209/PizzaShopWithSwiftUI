//
//  PizzaShopWithSwiftUIApp.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 02.03.2022.
//

import SwiftUI
import Firebase

let screen = UIScreen.main.bounds

@main
struct PizzaShopWithSwiftUIApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    var body: some Scene {
        WindowGroup {
            if let user = AuthService.shared.currentUser {
                let viewModel = MainTabBarViewModel(user: user)
                MainTabBar(viewModel: viewModel)
            } else {
                AuthView()
            }
        }
    }
    class AppDelegate: NSObject, UIApplicationDelegate {
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            
            FirebaseApp.configure()
            return true
        }
    }
}
