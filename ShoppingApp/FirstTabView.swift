//
//  FirstTabView.swift
//  ShoppingApp
//
//  Created by Karin Prater on 08.05.23.
//

import SwiftUI

struct FirstTabView: View {
    
    @StateObject var fetcher = ProductFetcher()
    @State private var showCategorySelector = false
    @State private var showSettings = false
    
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
        .sheet(isPresented: $showCategorySelector,
               onDismiss: {
            fetcher.load()
        }, content: {
            ProductCategoryListView(selectedCategory: $fetcher.selectedCategory)
        })
        .sheet(isPresented: $showSettings, content: {
            SettingsView()
                .interactiveDismissDisabled()
                //.presentationBackground(.ultraThinMaterial)
                .presentationBackground {
                    LinearGradient(colors: [Color.pink, .purple],
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                }
                .presentationCornerRadius(50)
        })
        
    }
}

struct FirstTabView_Previews: PreviewProvider {
    static var previews: some View {
        FirstTabView()
    }
}
