//
//  UserProfileButtonView.swift
//  ShoppingApp
//
//  Created by Karin Prater on 12.05.23.
//

import SwiftUI

struct UserProfileButtonOldView: View {
    @State private var showActionSheet = false
    
    var body: some View {
        Button {
            showActionSheet.toggle()
        } label: {
            Image(systemName: "person.fill")
        }
        .actionSheet(isPresented: $showActionSheet) {
            userSheet()
        }
    }
    
    func userSheet() -> ActionSheet {

        let picturButton = ActionSheet.Button.default(Text("Change Profile Picture")) {  }
        let profileButton = ActionSheet.Button.default(Text("Edit Profile Information")) {  }
        let logOutButton = ActionSheet.Button.destructive(Text("Log Out")) {  }
        let cancelButton = ActionSheet.Button.cancel(Text("Cancel")) {  }

        let buttons: [ActionSheet.Button] = [picturButton, profileButton, logOutButton, cancelButton]
        
        return ActionSheet(title: Text("Change Your Profile"),
                           message: Text(""),
                           buttons: buttons)
    }
}

struct UserProfileButtonOldView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileButtonOldView()
    }
}
