//
//  ShapesGroup.swift
//  SwiftUI Kit
//
//  Created by Jordan Singer on 7/10/20.
//

import SwiftUI

struct ShapesGroup: View {
    var body: some View {
        SectionView(
            title: "Rectangle",
            description: "A rectangular shape aligned inside the frame of the view containing it.",
            content: {
                Rectangle()
            }
        )
        
        SectionView(
            title: "RoundedRectangle",
            description: "A rectangular shape with rounded corners, aligned inside the frame of the view containing it.",
            content: {
                RoundedRectangle(cornerRadius: 4)
            }
        )
        
        SectionView(
            title: "Circle",
            description: "A circle centered on the frame of the view containing it.",
            content: {
                Circle()
            }
        )
        
        SectionView(
            title: "Ellipse",
            description: "An ellipse aligned inside the frame of the view containing it.",
            content: {
                Ellipse()
            }
        )
        
        SectionView(
            title: "Capsule",
            description: "A capsule shape aligned inside the frame of the view containing it.",
            content: {
                Capsule()
            }
        )
    }
}

struct ShapesGroup_Previews: PreviewProvider {
    static var previews: some View {
        ShapesGroup()
    }
}
