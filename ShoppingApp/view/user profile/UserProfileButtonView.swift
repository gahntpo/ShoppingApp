//
//  UserProfileButtonView.swift
//  ShoppingApp
//
//  Created by Karin Prater on 12.05.23.
//

import SwiftUI

struct UserProfileButtonView: View {
    
    @State private var showDialog = false
    
    var body: some View {
        Button {
            showDialog.toggle()
        } label: {
            Image(systemName: "person.fill")
        }
        .confirmationDialog("Change Your Profile",
                            isPresented: $showDialog) {
            Button("Change Profile Picture") { }
            Button("Edit Profile Information") { }
            
            Button("Log Out", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        }

    }
}

struct UserProfileButtonView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileButtonView()
    }
}
