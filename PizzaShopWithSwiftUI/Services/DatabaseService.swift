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
    private var orderRef: CollectionReference {
        return db.collection("orders")
    }
    
    private init() {}
    
    func getPositions(by orderID: String, completion: @escaping (Result<[Position], Error>)-> ()) {
        let positionsRef = orderRef.document(orderID).collection("positions")
        positionsRef.getDocuments { qSnap, error in
            if let querySnap = qSnap {
                var positions = [Position]()
                
                for doc in querySnap.documents {
                    if let position = Position(doc: doc) {
                        positions.append(position)
                    }
                }
                completion(.success(positions))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func getOrders(by userID: String?, completion: @escaping (Result<[Order], Error>)-> ()) {
        
        self.orderRef.getDocuments { qSnap, error in
            if let qSnap = qSnap {
                var orders = [Order]()
                for doc in qSnap.documents {
                    if let userID = userID {
                        if let order = Order(doc: doc), order.userID == userID {
                            orders.append(order)
                        }
                        } else { // Ветка админа
                            if let order = Order(doc: doc) {
                                orders.append(order)
                        }
                    }
                }
                completion(.success(orders))
            } else if let error = error {
                completion(.failure(error))
            }
            
        }
    }
    
    func setOrder(order: Order, completion: @escaping (Result<Order, Error>)-> ()) {
        
        orderRef.document(order.id).setData(order.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                self.setPositions(to: order.id,
                             positions: order.positions) { result in
                    switch result {
                        
                    case .success(let positions):
                        print(positions.count)
                        completion(.success(order))
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    func setPositions(to orderID: String,
                    positions: [Position],
                    completion: @escaping (Result<[Position], Error>)-> ()) {
        let positionRef = orderRef.document(orderID).collection("positions")
        for position in positions {
            positionRef.document(position.id).setData(position.representation)
        }
        completion(.success(positions))
    }
    
    func setProfile(user: MvUser, completion: @escaping (Result<MvUser, Error>) -> ()) {
        userRef.document(user.id).setData(user.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }
    
    func getProfile(by userID: String? = nil, completion: @escaping (Result<MvUser, Error>)-> ()) {
        userRef.document(userID != nil ? userID! : AuthService.shared.currentUser!.uid).getDocument { docSnapshot, error in
            guard let snap = docSnapshot else { return }
            guard let data = snap.data() else { return }
            
            guard let userName = data["name"] as? String else { return }
            guard let id = data["id"] as? String else { return }
            guard let phone = data["phone"] as? Int else { return }
            guard let adress = data["adress"] as? String else { return }
            
            let user = MvUser(id: id, name: userName, phone: phone, adress: adress)
            completion(.success(user))
            
        }
    }
    
    
}
