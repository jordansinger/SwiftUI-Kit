//
//  GesturesGroup.swift
//  SwiftUI Kit iOS
//
//  Created by Aaryan Kothari on 27/07/20.
//

import SwiftUI

struct GesturesGroup: View {
    var body: some View {
        Group{
            Text("Hello, World!")
        }
    }
}

struct TapGestureBlock : View {
    @State var count = 1
    @State var text = "Tap Gesture"
    var body : some View {
        Text(text)
            .onTapGesture(count:count,perform:tapped)
    }
    func tapped(){
        self.text = "Tap count : \(count)"
        self.count += 1
    }
}

struct DragGestureBlock : View {
    @State var isDragging = false
    
    var body : some View {
        Text("Drag Gesture")
            .foregroundColor(isDragging ? .pink : .accentColor)
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { _ in self.isDragging = true }
            .onEnded { _ in self.isDragging = false }
    }
}

struct LongPressGestureBlock: View {
    @GestureState var isDetectingLongPress = false
    @State var completedLongPress = false
    
    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 3)
            .updating($isDetectingLongPress) { currentstate, gestureState,transaction in
                gestureState = currentstate
                transaction.animation = Animation.easeIn(duration: 2.0)
            }
            .onEnded { finished in
                self.completedLongPress = finished
            }
    }
    
    var body: some View {
        Text("LongPress Gesture")
            .gesture(longPress)
    }
}

struct GesturesGroup_Previews: PreviewProvider {
    static var previews: some View {
        GesturesGroup()
    }
}
