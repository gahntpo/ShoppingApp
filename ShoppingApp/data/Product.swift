//
//  Product.swift
//  ShoppingApp
//
//  Created by Karin Prater on 08.05.23.
//

import Foundation

struct Product: Identifiable, Decodable, Hashable {
    var id: Int
    var title: String
    var price: Double
    var description: String
    var category: String
    var image: String
    var rating: Rating

    struct Rating: Decodable, Hashable {
        var rate: Double
        var count: Int
    }
    
    static func example() -> Product {
        Product(id: 1,
                title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                price: 9.95,
                description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                category: "men's clothing",
                image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                rating: Rating(rate: 3.9, count: 120))
    }
}

