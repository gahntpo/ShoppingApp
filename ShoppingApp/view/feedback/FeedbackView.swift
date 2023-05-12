//
//  FeedbackView.swift
//  ShoppingApp
//
//  Created by Karin Prater on 10.05.23.
//

import SwiftUI

struct FeedbackView: View {
    @State private var isEmojiPopoverPresented: Bool = false
    @State private var selectedEmoji: Emoji? = nil
    @State private var feedback: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("We Value Your Feedback")
                .font(.title)
            
            Text("Tell us more about your experience")
                .font(.title2)
            
            Divider()
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Write a Review")
                    .foregroundColor(.gray)
                TextEditor(text: $feedback)
                    .border(Color.gray, width: 1)
                    .frame(maxHeight: 300)
            }
            Button(action: {
                self.isEmojiPopoverPresented = true
            }) {
                HStack {
                    Text(selectedEmoji == nil ? "Or Select an Emoji" : "You selected: ")
                    Text(selectedEmoji?.emojiSting ?? "")
                        .font(.largeTitle)
                }
            }
            .popover(isPresented: $isEmojiPopoverPresented,
                     attachmentAnchor: .rect(.bounds),
                     arrowEdge: .top) {
                EmojiSelectorView(selection: $selectedEmoji)
                    .frame(minWidth: 300, maxHeight: 600)
                    .presentationCompactAdaptation(.none)
            }
            
            Spacer()
            
            SubmitReviewButtonView()
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding()
    }
}


struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView()
    }
}


