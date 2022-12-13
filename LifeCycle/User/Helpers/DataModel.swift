//
//  DataModel.swift
//  LifeCycle
//
//  Created by Admin on 26/10/22.
//

import Foundation
import FirebaseFirestore

struct Product {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
}

var productList = [Product(name: "White Sweater", image: "sweater1", price: 450),
                   Product(name: "Blue Sweater", image: "sweater2", price: 1000),
                   Product(name: "Highneck Sweater", image: "sweater3", price: 780),
                   Product(name: "Red Sweater", image: "sweater4", price: 600),
                   Product(name: "White Sweater", image: "sweater5", price: 450),
                   Product(name: "Gray Sweater", image: "sweater6", price: 900),

]

struct Users {
    let firstName: String?
    let lastName: String?
    let uid: String?
    
    static func build(from documents: [QueryDocumentSnapshot]) -> [Users]{
        var users = [Users]()
        for document in documents {
            users.append(Users(firstName: document["firstname"] as? String ?? "",
                               lastName: document["lastName"] as? String ?? "",
                               uid: document["uid"] as? String ?? ""))
        }
        return users
    }
}
