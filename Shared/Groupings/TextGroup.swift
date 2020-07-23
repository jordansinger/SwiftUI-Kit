//
//  TextGroup.swift
//  SwiftUI Kit
//
//  Created by Jordan Singer on 7/10/20.
//

import SwiftUI

struct TextGroup: View {
    @State private var text = ""
    @State private var password = ""
    @State private var textEditor = ""
    
    var body: some View {
        Group {
            SectionView(
                title: "Text",
                description: "A view that displays one or more lines of read-only text.",
                content: {
                    Text("Example")
                }
            )
            
            SectionView(
                title: "TextField",
                description: "A control that displays an editable text interface.",
                content: {
                    TextField("Placeholder", text: $text)
                }
            )
            
            SectionView(
                title: "SecureField",
                description: "A control into which the user securely enters private text.",
                content: {
                    SecureField("Password", text: $password)
                }
            )

            SectionView(
                title: "Redacted",
                description: "Modifier which hides the text, for example while loading.",
                content: {
                    Text("You cannot read me").redacted(reason: .placeholder)
                }
            )
            
            #if os(iOS) || os(OSX)
            SectionView(
                title: "TextEditor",
                description: "A view that can display and edit long-form text.",
                content: {
                    TextEditor(text: $textEditor)
                        .frame(height: 88)
                }
            )
            #endif
        }
    }
}

struct TextGroup_Previews: PreviewProvider {
    static var previews: some View {
        TextGroup()
            .previewLayout(.sizeThatFits)
    }
}
