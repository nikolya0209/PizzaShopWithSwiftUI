//
//  DatabaseService.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 30.03.2022.
//

import Foundation
import FirebaseFirestore

class DatabaseService {
    static let shared = DatabaseService()
    
    private let db = Firestore.firestore()
    
    private var userRef: CollectionReference {
        return db.collection("users")
    }
    
    private init() {}
    
    func setUser(user: MvUser, completion: @escaping (Result<MvUser, Error>) -> ()) {
        userRef.document(user.id).setData(user.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
            
        }
    }
    
    
    
}
