//
//  ProfileViewModel.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 26.04.2022.
//

import Foundation
import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var profile: MvUser
    
    init(profile: MvUser) {
        self.profile = profile
    }
    
    func setProfile() {
        DatabaseService.shared.setProfile(user: self.profile) { result in
            switch result {
                
            case .success(let user):
                print(user.name)
            case .failure(let error):
                print("Ошибка отпраки данных \(error.localizedDescription)")
            }
        }
    }
    
    func getProfile() {
        
    }
}
