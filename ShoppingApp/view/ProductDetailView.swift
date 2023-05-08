//
//  ProductDetailView.swift
//  ShoppingApp
//
//  Created by Karin Prater on 08.05.23.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: Product
    @State private var showAuthView = false
    
    var body: some View {
        VStack(spacing: 20) {
           ProductImageView(product: product)
            .frame(maxHeight: 250)
            
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.title2)
                    .padding(.bottom, 5)
                    .layoutPriority(3)
                
                Text(product.description)
                    .font(.callout)
                    .padding(.bottom)
                    .layoutPriority(2)
                
                HStack {
                    Text("Rating: \(product.rating.rate, specifier: "%.1f")")
                    Text("(\(product.rating.count))")
                        .foregroundColor(.gray)
                    Spacer()
                    Text(product.category)
                        .foregroundColor(.white)
                        .padding(.horizontal, 13).padding(.vertical, 3)
                        .background(Capsule().fill(Color.indigo))
                }
                
                Text("$\(product.price, specifier: "%.2f")")
                    .bold()
                    .foregroundColor(.green)

                Button {
                    // check if logged in, otherwise
                    showAuthView.toggle()
                } label: {
                    Label("Buy Now", systemImage: "cart")
                        .frame(maxWidth: .infinity)
                        .padding(5)
                }
                .buttonStyle(.borderedProminent)
                .frame(maxHeight: .infinity)
            }
        }
        .padding(.horizontal)
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $showAuthView) {
            AuthenticationView()
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product.example())
    }
}
