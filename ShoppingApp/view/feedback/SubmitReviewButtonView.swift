//
//  SubmitReviewButtonView.swift
//  ShoppingApp
//
//  Created by Karin Prater on 10.05.23.
//

import SwiftUI

// alert closes when button pressed
// dismiss to go back in navigationstack

struct SubmitReviewButtonView: View {
    
    @State private var showAlert = false
    @State private var error: SubmitReviewError? = nil

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button(action: {
            error = .noNetworkConnection
            showAlert = true
        }) {
            Text("Submit")
        }
        .buttonStyle(.borderedProminent)
        
        .alert(isPresented: $showAlert, error: error) { _ in
       //     Button("Try Again") {
                // Handle acknowledgement.
       //     }
            
            // Delete My Review
            Button("Delete Review", role: .destructive) {
                dismiss()
            }
            
            Button("Cancel", role: .cancel) {
                // Handle the acknowledgement.
               
            }
            

        } message: { error in
            Text(error.recoverySuggestion ?? "Try again later.")
        }
        
    }
}

struct SubmitReviewButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitReviewButtonView()
    }
}
