//
//  ProductCategoryListView.swift
//  ShoppingApp
//
//  Created by Karin Prater on 08.05.23.
//

import SwiftUI

struct ProductCategoryListView: View {
    
    @StateObject private var categoryFetcher = ProductCategoryFetcher()
    @Binding var selectedCategory: String?
    @State private var searchText = ""
    @Environment(\.dismiss) var dismiss
    
    var categories: [String] {
        guard !searchText.isEmpty else { return categoryFetcher.categories }
        
        return categoryFetcher.categories.filter { category in
            category.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        NavigationView {
            List(selection: $selectedCategory){
                ForEach(categories, id: \.self) { category in
                    Text(category)
                }
            }
            .navigationTitle("Select a Category")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem {
                    Button {
                        dismiss()
                    } label: {
                        Label("Dismiss", systemImage: "xmark.circle.fill")
                    }

                }
            })
            .searchable(text: $searchText)
            .onAppear {
                categoryFetcher.loadPoductCategories()
            }
        }
    }
}

struct ProductCategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCategoryListView(selectedCategory: .constant(nil))
    }
}
