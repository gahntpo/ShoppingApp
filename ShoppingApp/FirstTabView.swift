//
//  FirstTabView.swift
//  ShoppingApp
//
//  Created by Karin Prater on 08.05.23.
//

import SwiftUI

struct FirstTabView: View {
    
    @StateObject var fetcher = ProductFetcher()
    
    @State private var showSettings: Bool = false
    @State private var showCategorySelector: Bool = false
    
    var body: some View {
        NavigationStack(root: {
            ProductListView(products: fetcher.products,
                            state: fetcher.state)
            .toolbar {
                
                ToolbarItem(placement: .navigation) {
                    Button {
                        showSettings.toggle()
                    } label: {
                        Label("Settings", systemImage: "gear")
                    }
                }
                ToolbarItem {
                    Button {
                        showCategorySelector.toggle()
                    } label: {
                        Label("Choose Category", systemImage: "line.3.horizontal.decrease.circle")
                    }
                }
            }
            
            .onAppear {
                fetcher.load()
            }
            .navigationDestination(for: Product.self, destination: { product in
                ProductDetailView(product: product)
            })
        })
        .sheet(isPresented: $showCategorySelector, onDismiss: {
            fetcher.products = []
            fetcher.load()
        }) {
            ProductCategoryListView(selectedCategory: $fetcher.selectedCategory)
        }
        
        .sheet(isPresented: $showSettings) {
            SettingsView()
             // .presentationBackground(.thinMaterial)
                .presentationBackground(alignment: .bottom) {
                    LinearGradient(colors: [Color.pink, Color.purple], startPoint: .bottomLeading, endPoint: .topTrailing)
                }
                .presentationCornerRadius(50)
                .interactiveDismissDisabled()
        }
    }
}

struct FirstTabView_Previews: PreviewProvider {
    static var previews: some View {
        FirstTabView()
    }
}
