//
//  ImagesGroup.swift
//  SwiftUI Kit
//
//  Created by Jordan Singer on 7/10/20.
//

import SwiftUI

struct ImagesGroup: View {
    var body: some View {
        Group {
            SectionView(
                title: "Image",
                description: "A view that displays an environment-dependent image.",
                content: {
                    Image("Waterfall")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 128)
                }
            )
            
            SectionView(
                title: "System Images",
                description: "Built-in icons that represent common tasks and types of content in a variety of use cases. The full list of icons is available in the SF Symbols app.",
                content: {
                    Group {
                        Image(systemName: "memories.badge.plus")
                            // This modifier lets you use the new multi-color system icons in SF Symbols 2
                            .renderingMode(.original)
                        Image(systemName: "memories.badge.plus")
                    }
                }
            )
            
            SectionView(
                title: "Label",
                description: "A standard label for user interface items, consisting of an icon with a title.",
                content: {
                    Group {
                        Label("Rain", systemImage: "cloud.rain")
                        Label("Snow", systemImage: "snow")
                        Label("Sun", systemImage: "sun.max")
                    }
                }
            )
        }
    }
}

struct ImagesGroup_Previews: PreviewProvider {
    static var previews: some View {
        ImagesGroup()
            .previewLayout(.sizeThatFits)
    }
}
