//
//  SubmitReviewButtonOldAlertView.swift
//  ShoppingApp
//
//  Created by Karin Prater on 10.05.23.
//

import SwiftUI

// short buttons horizonal stack
// long verical stack






struct SubmitReviewButtonOldAlertView: View {
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
        .alert(isPresented: $showAlert, content: {
            Alert(
                title: Text(error?.localizedDescription ?? "Try again later."),
                message: Text(error?.recoverySuggestion ?? ""),
                primaryButton: .default(
                    Text("Try Again"),
                    action: {
                        // try again
                    }
                ),
                secondaryButton: .destructive(
                    Text("Delete My Review"),
                    action: {
                        dismiss()
                   }
                )
            )
        })
        
    }
}




struct SubmitReviewButtonOldAlertView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitReviewButtonOldAlertView()
    }
}
