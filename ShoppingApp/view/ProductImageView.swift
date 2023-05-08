//
//  ProductImageView.swift
//  ShoppingApp
//
//  Created by Karin Prater on 08.05.23.
//

import SwiftUI

struct ProductImageView: View {
    
    let product: Product
    
    var body: some View {
        AsyncImage(url: URL(string: product.image)) { phase in
            switch phase {
                case .empty:
                    ZStack {
                        Color.white
                        ProgressView()
                    }
                case .failure(let error): Text(error.localizedDescription)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                    
                @unknown default:
                    fatalError()
            }
        }
    }
}

struct ProductImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProductImageView(product: Product.example())
    }
}
