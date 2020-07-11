//
//  SectionView.swift
//  SwiftUI Kit
//
//  Created by Jordan Singer on 7/10/20.
//

import SwiftUI

struct SectionView<Content: View>: View {
    var title: String
    var description: String
    let content: () -> Content
    
    var body: some View {
        Section(footer: Text(description)) {
            Text(title)
                .font(.headline)
            
            content()
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(title: "Section", description: "Description", content: { Text("Content") })
            .previewLayout(.sizeThatFits)
    }
}
