//
//  SecondTabView.swift
//  ShoppingApp
//
//  Created by Karin Prater on 08.05.23.
//

import SwiftUI

struct SecondTabView: View {
    @StateObject var fetcher = AutomaticProductFetcher()
    @State private var showCategorySelector = false
    @State private var currentDetent = PresentationDetent.large
    
    var body: some View {
        NavigationStack {
            ProductListView(products: fetcher.products,
                            state: fetcher.state)
            .toolbar {
                ToolbarItemGroup(placement: .navigation) {
                    UserProfileButtonView()
                }
                
                ToolbarItem {
                    Button {
                        showCategorySelector.toggle()
                    } label: {
                        Label("Choose Category", systemImage: "line.3.horizontal.decrease.circle")
                    }
                }
            }
            .navigationDestination(for: Product.self, destination: { product in
                ProductDetailView(product: product)
            })
        }
        .sheet(isPresented: $showCategorySelector, content: {
            ProductCategoryListView(selectedCategory: $fetcher.selectedCategory)
                .presentationDetents([.medium, .large, .fraction(0.75), .height(200)], selection: $currentDetent)
                .presentationBackgroundInteraction(.enabled(upThrough: .height(200)))
                .presentationContentInteraction(.scrolls)
        })
    }
}

struct SecondTabView_Previews: PreviewProvider {
    static var previews: some View {
        SecondTabView()
    }
}
