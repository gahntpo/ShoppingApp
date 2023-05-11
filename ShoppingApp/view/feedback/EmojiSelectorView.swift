//
//  EmojiSelectorView.swift
//  ShoppingApp
//
//  Created by Karin Prater on 10.05.23.
//

import SwiftUI






struct EmojiSelectorView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var selection: Emoji?
    
    let columns = [GridItem(.adaptive(minimum: 44), spacing: 10)]
    let emojis: [Emoji]  = Emoji.examples()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Select an Emoji")
                .font(.title3)
                .padding(.horizontal)
            
            Divider()
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(emojis) { emoji in
                        ZStack {
                            emoji == selection ? Color.blue : Color.clear
                            Text(emoji.emojiSting)
                                .font(.title)
                                .padding(5)
                                .onTapGesture {
                                    selection = emoji
                                    dismiss()
                                }
                        }
                    }
                }.padding()
            }
        }
        .padding(.vertical)
    }
}




struct EmojiSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiSelectorView(selection: .constant(nil))
    }
}
