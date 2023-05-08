//
//  AutomaticProductFetcher.swift
//  ShoppingApp
//
//  Created by Karin Prater on 08.05.23.
//

import Foundation
import Combine

class AutomaticProductFetcher: ObservableObject {
    @Published var state: FetcherState = .good
    @Published var products = [Product]()
    @Published var selectedCategory: String? = nil
    
    private let service = APIService()
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        $selectedCategory.removeDuplicates().sink { [unowned self] category in
            if let selectedCategory = category {
               loadPoducts(for: selectedCategory)
            } else {
                loadPoducts()
            }
        }.store(in: &subscriptions)
    }
    
    private func loadPoducts() {
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
        products = []
        
        service.fetchProducts(for: category) { result in
            DispatchQueue.main.async {
                switch result {
                    case .failure(let error):
                        print("error: " + error.localizedDescription)
                        self.state = .error(error.localizedDescription)
                    case .success(let products):
                        self.products = products
                        self.state = .good
                }
            }
        }
    }
    
    static func preview() -> AutomaticProductFetcher {
        let fetcher = AutomaticProductFetcher()
        fetcher.products = [Product.example()]
        return fetcher
    }
}
