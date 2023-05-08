//
//  ProductListView.swift
//  ShoppingApp
//
//  Created by Karin Prater on 08.05.23.
//

import SwiftUI

struct ProductListView: View {
    
    let products: [Product]
    let state: FetcherState
    
    var body: some View {
        ZStack {
            List {
                ForEach(products) { product in
                    NavigationLink(value: product) {
                        ProductRow(product: product)
                    }
                }
            }
            .navigationTitle("Products")
            .listStyle(.inset)
         
            if state == .loading {
                ProgressView()
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(products: [Product.example()], state: .good)
    }
}
