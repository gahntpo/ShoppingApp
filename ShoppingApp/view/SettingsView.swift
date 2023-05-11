//
//  SettingsView.swift
//  ShoppingApp
//
//  Created by Karin Prater on 08.05.23.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 50) {
            Text("Settings")
                .font(.title)
                .bold()
            
            Button {
                dismiss()
            } label: {
                Text("Done")
            }
            .buttonStyle(.bordered)

        }
           // .foregroundColor(.white)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
