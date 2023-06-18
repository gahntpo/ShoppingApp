//
//  ProductDetailView.swift
//  ShoppingApp
//
//  Created by Karin Prater on 08.05.23.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: Product
    @State private var showAuth = false
    @State private var selectedTagColor: TagColor = .blue
    
    var body: some View {
        VStack(spacing: 20) {
           ProductImageView(product: product)
            .frame(maxWidth: .infinity, maxHeight: 250)
            .padding()
            .background(Color.white)
            
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
                
                NavigationLink {
                    FeedbackView()
                } label: {
                    Text("Leave a Review")
                }
                .padding(.bottom)
                
                Text("$\(product.price, specifier: "%.2f")")
                    .bold()
                    .foregroundColor(.green)
                
                Button {
                    // check if logged in, otherwise show auth view
                    showAuth.toggle()
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
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $showAuth, content: {
            AuthenticationView()
        })
        #else
        .sheet(isPresented: $showAuth, content: {
            AuthenticationView()
        })
        #endif
        .toolbar(content: {
            Menu {
                
                ControlGroup("Customize") {
                    Button {
                        
                    } label: {
                        Label("Add to Favorites", systemImage: "heart")
                    }
                    
                    Button {
                    } label: {
                        Label("Share", systemImage: "square.and.arrow.up")
                    }
                    
                    Button {
                    } label: {
                        Label("Open Shopping Cart", systemImage: "cart")
                    }
                }
                .controlGroupStyle(.compactMenu)
                
                Picker("Select a tag color",
                       selection: $selectedTagColor) {
                    ForEach(TagColor.allCases) { tag in
                        Label(tag.rawValue.capitalized, systemImage: "tag")
                            .tint(tag.color)
                    }
                }
                #if os(iOS)
               .paletteSelectionEffect(.symbolVariant(.fill))
                .pickerStyle(.palette)
                #endif
            } label: {
                Label("more", systemImage: "ellipsis.circle")
            }
        })
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProductDetailView(product: Product.example())
        }
    }
}
