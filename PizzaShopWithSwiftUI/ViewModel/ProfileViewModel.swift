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
}
