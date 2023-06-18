//
//  NavigationSplitExample.swift
//  ShoppingApp
//
//  Created by Karin Prater on 13.06.23.
//

import SwiftUI

struct NavigationSplitExample: View {
    
    @StateObject var fetcher = AutomaticProductFetcher()
    @StateObject private var categoryFetcher = ProductCategoryFetcher()
    @State private var showCategorySelector = false
    @State private var selectedProduct: Product? = nil
    
    var body: some View {
        NavigationSplitView {
            if fetcher.state == .loading {
                ProgressView()
            } else {
                List(fetcher.products,  selection: $selectedProduct) { product in
                    ProductRow(product: product)
                        .tag(product)
                }
                .frame(minWidth: 200)
                .toolbar {
                    /*
                    ToolbarItem {
                        Button {
                            showCategorySelector.toggle()
                        } label: {
                            Label("Choose Category", systemImage: "line.3.horizontal.decrease.circle")
                        }
                        .popover(isPresented: $showCategorySelector, content: {
                            
                            SimpleProductCategoryListView(selectedCategory: $fetcher.selectedCategory)
                                .frame(minHeight: 300)
                        })
                    }
                     */
                    ToolbarItem {
                        Menu {
                            ProductCategoryPickerView(categoryFetcher: categoryFetcher,
                                                      selectedCategory: $fetcher.selectedCategory)
                                .pickerStyle(.inline)
                                .frame(minHeight: 100)
                        } label: {
                            Label("Filter", systemImage: "line.3.horizontal.decrease.circle")
                        }
                    }
                }
            }
        } detail: {
            if let product = selectedProduct {
                NavigationStack {
                    
                    ProductDetailView(product: product)
                        .padding()
                        .frame(maxWidth: 600)
                    
                }
            } else {
                Image(systemName: "chart")
            }
        }
       
        .onAppear {
            categoryFetcher.loadPoductCategories()
        }
       
    }
}

struct NavigationSplitExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationSplitExample()
    }
}
