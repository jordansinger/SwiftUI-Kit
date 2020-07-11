//
//  FontsGroup.swift
//  SwiftUI Kit
//
//  Created by Jordan Singer on 7/10/20.
//

import SwiftUI

struct FontsGroup: View {
    var body: some View {
        Group {
            Group {
                Section(footer: Text("A font with the large title text style.")) {
                    Text("largeTitle")
                        .font(.largeTitle)
                }
                
                Section(footer: Text("A font with the title text style.")) {
                    Text("title")
                        .font(.title)
                }
                
                Section(footer: Text("Create a font for second level hierarchical headings.")) {
                    Text("title2")
                        .font(.title2)
                }
                
                Section(footer: Text("Create a font for third level hierarchical headings.")) {
                    Text("title3")
                        .font(.title3)
                }
            }
            
            Group {
                Section(footer: Text("A font with the headline text style.")) {
                    Text("headline")
                        .font(.headline)
                }
                
                Section(footer: Text("A font with the subheadline text style.")) {
                    Text("subheadline")
                        .font(.subheadline)
                }
            }
            
            Section(footer: Text("A font with the body text style.")) {
                Text("body")
                    .font(.body)
            }
            
            Section(footer: Text("A font with the callout text style.")) {
                Text("callout")
                    .font(.callout)
            }
            
            Group {
                Section(footer: Text("A font with the caption text style.")) {
                    Text("caption")
                        .font(.caption)
                }
                
                Section(footer: Text("Create a font with the alternate caption text style.")) {
                    Text("caption2")
                        .font(.caption2)
                }
            }
            
            Section(footer: Text("A font with the footnote text style.")) {
                Text("footnote")
                    .font(.footnote)
            }
        }
    }
}

struct FontsGroup_Previews: PreviewProvider {
    static var previews: some View {
        FontsGroup()
            .previewLayout(.sizeThatFits)
    }
}
