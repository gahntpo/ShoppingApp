//
//  SubmitReviewError.swift
//  ShoppingApp
//
//  Created by Karin Prater on 10.05.23.
//

import Foundation

enum SubmitReviewError: Error, LocalizedError {
    case notBoughtProduct
    case noNetworkConnection
    
    var failureReason: String? {
        switch self {
            case .notBoughtProduct:
               return "Did not buy prouct."
            case .noNetworkConnection:
               return "No Internet."
        }
    }
    
    var recoverySuggestion: String? {
        switch self {
            case .notBoughtProduct:
               return "Maybe try next time."
            case .noNetworkConnection:
               return "Please, check settings."
        }
    }
    
    var errorDescription: String? {
        switch self {
            case .notBoughtProduct:
               return "Maybe try next time."
            case .noNetworkConnection:
               return "You are ot connected to the internet."
        }
    }
}
