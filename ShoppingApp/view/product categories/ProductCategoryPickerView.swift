//
//  ProductCategoryPickerView.swift
//  ShoppingApp
//
//  Created by Karin Prater on 13.06.23.
//

import SwiftUI

struct ProductCategoryPickerView: View {
    
    @StateObject private var categoryFetcher = ProductCategoryFetcher()
    @Binding var selectedCategory: String
    @State private var searchText = ""
    @Environment(\.dismiss)  var dismiss
    
    var categories: [String] {
        guard !searchText.isEmpty else { return categoryFetcher.categories }
        
        return categoryFetcher.categories.filter { category in
            category.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        ZStack {
            if categoryFetcher.categories.count > 0 {
                Picker(selection: $selectedCategory) {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                    }
                    Text("all")
                        
                } label: {
                    Text("select")
                }
            } else {
                ProgressView()
            }
        }
        .onAppear {
            categoryFetcher.loadPoductCategories()
        }
    }
}

struct ProductCategoryPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCategoryPickerView(selectedCategory: .constant("all"))
    }
}
