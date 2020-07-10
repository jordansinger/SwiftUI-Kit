//
//  ContentView.swift
//  SwiftUI Kit
//
//  Created by Jordan Singer on 7/10/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Grouping(title: "Buttons", icon: "capsule", content: { ButtonsGroup() })
                Grouping(title: "Colors", icon: "paintpalette", content: { ColorsGroup() })
                Grouping(title: "Controls", icon: "slider.horizontal.3", content: { ControlsGroup() })
                Grouping(title: "Fonts", icon: "textformat", content: { FontsGroup() })
                Grouping(title: "Haptics", icon: "hand.tap", content: { HapticsGroup() })
                Grouping(title: "Images", icon: "photo", content: { ImagesGroup() })
                Grouping(title: "Indicators", icon: "speedometer", content: { IndicatorsGroup() })
                Grouping(title: "Shapes", icon: "square.on.circle", content: { ShapesGroup() })
                Grouping(title: "Text", icon: "text.aligncenter", content: { TextGroup() })
            }
            .navigationBarTitle("SwiftUI")
            
            Text("Select a group")
        }
        .accentColor(.accentColor)
    }
}

struct Grouping<Content: View>: View {
    var title: String
    var icon: String
    var content: () -> Content
    
    var body: some View {
        NavigationLink(destination: GroupView(title: title, content: content)) {
            Label(title, systemImage: icon)
                .font(.headline)
                .padding(.vertical, 8)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
