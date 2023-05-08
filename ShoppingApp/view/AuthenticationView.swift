//
//  AuthenticationView.swift
//  ShoppingApp
//
//  Created by Karin Prater on 08.05.23.
//

import SwiftUI

struct AuthenticationView: View {
    @State private var email = ""
    @State private var password = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Text("You need to be logged in to make a purchase.")
                .font(.largeTitle)
                .padding(.bottom, 60)
            
            Text("Create an account now!")
                .font(.title)
                .padding(.bottom, 30)
            
            TextField("enter your email", text: $email)
                .textFieldStyle(.roundedBorder)
            TextField("enter your pasword", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom, 30)
            
            Button {
            } label: {
                Text("Sign Up")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            
            Button {
            } label: {
                Text("Log In")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            
            
            Button {
                dismiss()
            } label: {
                Text("Not now")
                    .frame(maxWidth: .infinity)
            }
            .padding(.top)
            
        }
        .padding(30)
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
