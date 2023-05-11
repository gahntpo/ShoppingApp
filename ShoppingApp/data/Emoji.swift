//
//  Emoji.swift
//  ShoppingApp
//
//  Created by Karin Prater on 10.05.23.
//

import Foundation

struct Emoji: Identifiable, Equatable {
    let value: Int
    var emojiSting: String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
    var valueString: String {
        String(format: "%x", value)
    }
    
    var id: Int {
        return value
    }
    
    static func examples() -> [Emoji] {
        let values = 0x1f600...0x1f64f
        return values.map {  Emoji(value: $0) }
    }
}
