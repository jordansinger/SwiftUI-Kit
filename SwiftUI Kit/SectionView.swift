//
//  SectionView.swift
//  SwiftUI Kit
//
//  Created by Jordan Singer on 7/10/20.
//

import SwiftUI

struct SectionView<Content: View>: View {
    var title: String?
    var description: String
    let content: () -> Content
    
    var body: some View {
        Group {
            #if os(iOS)
            Section(footer: Text(description)) {
                if let title = title {
                    Text(title)
                        .font(.headline)
                }
                content()
            }
            #else
            Group {
                if let title = title {
                    Text(title).font(.title3).bold()
                }
                content()
                Text(description).font(.body).foregroundColor(.secondary)
                Divider()
            }
            #endif
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(title: "Section", description: "Description", content: { Text("Content") })
            .previewLayout(.sizeThatFits)
    }
}
