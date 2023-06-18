//
//  SimpleProductCategoryListView.swift
//  ShoppingApp
//
//  Created by Karin Prater on 13.06.23.
//

import SwiftUI

struct SimpleProductCategoryListView: View {
    
    @StateObject private var categoryFetcher = ProductCategoryFetcher()
    @Binding var selectedCategory: String?
    @State private var searchText = ""
    @Environment(\.dismiss)  var dismiss
    
    var categories: [String] {
        guard !searchText.isEmpty else { return categoryFetcher.categories }
        
        return categoryFetcher.categories.filter { category in
            category.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        VStack {
            Text("Select a Category").bold()
                .padding()
            
            List(selection: $selectedCategory){
                ForEach(categories, id: \.self) { category in
                    Text(category)
                }
            }
            .listStyle(.sidebar)
            
            Button("all") {
                selectedCategory = nil
            }
            .buttonStyle(.bordered)
        }
        
        .onAppear {
            categoryFetcher.loadPoductCategories()
        }
    }
}

struct SimpleProductCategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleProductCategoryListView(selectedCategory: .constant(nil))
    }
}
