//
//  ContentView.swift
//  ShoppingApp
//
//  Created by Karin Prater on 08.05.23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {

            FirstTabView()
                .tabItem {
                    Label("First", systemImage: "1.circle")
                }
            
            SecondTabView()
                .tabItem {
                    Label("Second", systemImage: "2.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
