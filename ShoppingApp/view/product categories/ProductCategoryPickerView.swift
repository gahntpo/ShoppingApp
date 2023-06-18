//
//  ProductCategoryPickerView.swift
//  ShoppingApp
//
//  Created by Karin Prater on 13.06.23.
//

import SwiftUI

struct ProductCategoryPickerView: View {
    
    @ObservedObject var categoryFetcher: ProductCategoryFetcher
    @Binding var selectedCategory: String?
    @State private var pickerSelection: String = "all"
    
    var categories: [String] {
        var result = categoryFetcher.categories
      result.append("all")
        return result
    }

    var body: some View {
        ZStack {
            if categoryFetcher.categories.count > 0 {
                Picker(selection: $pickerSelection) {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                    }
                } label: {
                    Text("Filter by category")
                }
            } else {
                ProgressView()
            }
        }
        .onChange(of: selectedCategory) { newValue in
            guard newValue != pickerSelection else { return }
            pickerSelection = newValue ?? "all"
        }
        .onChange(of: pickerSelection) { newValue in
            if newValue == "all" {
                self.selectedCategory = nil
            } else {
                selectedCategory = newValue
            }
        }
    }
}

struct ProductCategoryPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCategoryPickerView(categoryFetcher: ProductCategoryFetcher(),
                                  selectedCategory: .constant("all"))
    }
}
