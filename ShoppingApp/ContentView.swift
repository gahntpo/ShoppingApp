//
//  ContentView.swift
//  ShoppingApp
//
//  Created by Karin Prater on 08.05.23.
//

import SwiftUI

struct ContentView: View {
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var hori
    #endif
    
    var isCompact: Bool {
        #if os(macOS)
        return false
        #else
        return hori == .compact
        #endif
    }
    
    var body: some View {
        if isCompact {
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
            
        } else {
            NavigationSplitExample()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
