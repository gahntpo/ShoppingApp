//
//  ProductRow.swift
//  ShoppingApp
//
//  Created by Karin Prater on 08.05.23.
//

import SwiftUI

struct ProductRow: View {
    var product: Product
    
    var body: some View {
        HStack {
            ProductImageView(product: product)
                .frame(width: 120, height: 120)
            
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.headline)
                    .padding(.bottom, 5)
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.green)
                HStack {
                    Text("Rating: \(product.rating.rate, specifier: "%.1f")")
                    Text("(\(product.rating.count))")
                        .foregroundColor(.gray)
                }
                
                Text(product.category)
                    .foregroundColor(.white)
                    .padding(.horizontal, 13).padding(.vertical, 3)
                    .background(Capsule().fill(Color.indigo))
            }
        }
    }
}


struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: Product.example())
    }
}
