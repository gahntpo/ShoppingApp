//
//  ProductFetcher.swift
//  ShoppingApp
//
//  Created by Karin Prater on 08.05.23.
//

import Foundation

enum FetcherState: Equatable {
    case good
    case loading
    case error(String)
}

class ProductFetcher: ObservableObject {
    
    @Published var state: FetcherState = .good
    @Published var products = [Product]()
    @Published var selectedCategory: String? = nil
    
    private let service = APIService()
    
    
    func load() {
        if let selectedCategory = selectedCategory {
           loadPoducts(for: selectedCategory)
        } else {
            loadPoducts()
        }
    }
    
    private func loadPoducts() {
        guard products.count == 0 else {
            return
        }
        
        state = .loading
        
        service.fetchProducts { result in
            DispatchQueue.main.async {
                switch result {
                    case .failure(let error):
                        print(error.localizedDescription)
                        self.state = .error(error.localizedDescription)
                    case .success(let products):
                        self.products = products
                        self.state = .good
                }
            }
        }
    }
    
    private func loadPoducts(for category: String) {
        
        state = .loading
        
        service.fetchProducts(for: category) { result in
            DispatchQueue.main.async {
                switch result {
                    case .failure(let error):
                        print(error.localizedDescription)
                        self.state = .error(error.localizedDescription)
                    case .success(let products):
                        self.products = products
                        self.state = .good
                }
            }
        }
    }
    
    static func preview() -> ProductFetcher {
        let fetcher = ProductFetcher()
        fetcher.products = [Product.example()]
        return fetcher
    }
}
