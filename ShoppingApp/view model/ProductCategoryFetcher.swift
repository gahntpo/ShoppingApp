//
//  ProductCategoryFetcher.swift
//  ShoppingApp
//
//  Created by Karin Prater on 08.05.23.
//

import Foundation

class ProductCategoryFetcher: ObservableObject {

    enum State: Equatable {
        case good
        case loading
        case error(String)
    }
    
    @Published var state: State = .good
    @Published var categories = [String]()
    
    private let service = APIService()
    
    func loadPoductCategories() {
        guard categories.count == 0 else {
            return
        }
    
        state = .loading
        
        service.fetchCaategories { result in
            DispatchQueue.main.async {
                switch result {
                    case .failure(let error):
                        print(error.localizedDescription)
                        self.state = .error(error.localizedDescription)
                    case .success(let categories):
                        self.categories = categories
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
