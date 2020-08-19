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
            SectionView(description: "A Gesture that requires a certain number of taps.") {
                TapGestureBlock()
            }
            
            SectionView(description: "A Gesture that detects drag motion.") {
                DragGestureBlock()
            }
            
            SectionView(description: "A Gesture that detects a Long Press.") {
                LongPressGestureBlock()
            }
        }
    }
}

struct TapGestureBlock : View {
    @State var count = 1
    var body : some View {
        Group{
            HStack{
                Text("Tap Gesture")
                Spacer()
                Text("Tap count: \(count)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .onTapGesture(count: count, perform: tapped)
    }
    func tapped() {
        self.count += 1
    }
}

struct DragGestureBlock : View {
    @State var color : Color = .accentColor
    
    var body : some View {
        Text("Drag Gesture")
            .gesture(drag)
            .foregroundColor(color)
    }
    
    var drag: some Gesture {
        DragGesture(minimumDistance: 10, coordinateSpace: .local)
            .onChanged { value in
                self.color = (value.distance > 300) ? .green : .red
            }
            .onEnded { value in
                self.color = (value.distance > 300) ? .green : .accentColor
            }
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
            .foregroundColor(textColor())
            .gesture(longPress)
    }
    
    func textColor()->Color{
        return self.isDetectingLongPress ? Color.red :
            (self.completedLongPress ? .green : .accentColor)
    }
}

struct GesturesGroup_Previews: PreviewProvider {
    static var previews: some View {
        GesturesGroup()
    }
}

extension DragGesture.Value {
    var distance: CGFloat {
        return sqrt(pow(self.predictedEndLocation.x,2) + pow(self.predictedEndLocation.y,2))
    }
}
