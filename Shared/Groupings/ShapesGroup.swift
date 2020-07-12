//
//  ShapesGroup.swift
//  SwiftUI Kit
//
//  Created by Jordan Singer on 7/10/20.
//

import SwiftUI

struct ShapesGroup: View {
    
    // Define constraints for the shape frames so they don’t stretch out too much on macOS
    let frameMinWidth: CGFloat = 16
    let frameMaxWidth: CGFloat = 256
    let frameMinHeight: CGFloat = 32
    let frameMaxHeight: CGFloat = 64
    
    var body: some View {
        Group {
            SectionView(
                title: "Rectangle",
                description: "A rectangular shape aligned inside the frame of the view containing it.",
                content: {
                    Rectangle()
                        .frame(
                            minWidth: frameMinWidth,
                            maxWidth: frameMaxWidth,
                            minHeight: frameMinHeight,
                            maxHeight: frameMaxHeight)
                }
            )
            
            SectionView(
                title: "RoundedRectangle",
                description: "A rectangular shape with rounded corners, aligned inside the frame of the view containing it.",
                content: {
                    RoundedRectangle(cornerRadius: 4)
                        .frame(
                            minWidth: frameMinWidth,
                            maxWidth: frameMaxWidth,
                            minHeight: frameMinHeight,
                            maxHeight: frameMaxHeight)
                }
            )
            
            SectionView(
                title: "Circle",
                description: "A circle centered on the frame of the view containing it.",
                content: {
                    Circle()
                        .frame(
                            minWidth: frameMinWidth,
                            maxWidth: frameMaxWidth,
                            minHeight: frameMinHeight,
                            maxHeight: frameMaxHeight)
                }
            )
            
            SectionView(
                title: "Ellipse",
                description: "An ellipse aligned inside the frame of the view containing it.",
                content: {
                    Ellipse()
                        .frame(
                            minWidth: frameMinWidth,
                            maxWidth: frameMaxWidth,
                            minHeight: frameMinHeight,
                            maxHeight: frameMaxHeight)
                }
            )
            
            SectionView(
                title: "Capsule",
                description: "A capsule shape aligned inside the frame of the view containing it.",
                content: {
                    Capsule()
                        .frame(
                            minWidth: frameMinWidth,
                            maxWidth: frameMaxWidth,
                            minHeight: frameMinHeight,
                            maxHeight: frameMaxHeight)
                }
            )
        }
    }
}

struct ShapesGroup_Previews: PreviewProvider {
    static var previews: some View {
        ShapesGroup()
            .previewLayout(.sizeThatFits)
    }
}
