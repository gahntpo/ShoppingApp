//
//  SecondTabView.swift
//  ShoppingApp
//
//  Created by Karin Prater on 08.05.23.
//

import SwiftUI

struct SecondTabView: View {
    @StateObject var fetcher = AutomaticProductFetcher()
    
    @State private var showSettings: Bool = false
    @State private var showCategorySelector: Bool = false
    
    var body: some View {
        NavigationStack {
            ProductListView(products: fetcher.products,
                            state: fetcher.state)
            .toolbar {
                ToolbarItem {
                    Button {
                        showCategorySelector.toggle()
                    } label: {
                        Label("Settings",
                              systemImage: "line.3.horizontal.decrease.circle")
                    }
                }
            }
            .navigationDestination(for: Product.self, destination: { product in
                ProductDetailView(product: product)
            })
        }
        
        .sheet(isPresented: $showCategorySelector) {
            ProductCategoryListView(selectedCategory: $fetcher.selectedCategory)
                .presentationDetents([.medium])
        }
    }
}

struct SecondTabView_Previews: PreviewProvider {
    static var previews: some View {
        SecondTabView()
    }
}
