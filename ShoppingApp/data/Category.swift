//
//  Category.swift
//  ShoppingApp
//
//  Created by Karin Prater on 08.05.23.
//

import Foundation

enum Category: String, CaseIterable, Identifiable {
    case electronics
    case jewelery
    case menCloth
    case womenCloth
    
    var title: String {
        switch self {
            case .electronics: return "electronics"
            case .jewelery: return "jewelery"
            case .menCloth: return "men's clothing"
            case .womenCloth: return "women's clothing"
        }
    }
    
    var id: Self { return self }
}
