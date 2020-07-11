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
                    Image("Image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 128)
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
    }
}
