//
//  ControlsGroup.swift
//  SwiftUI Kit
//
//  Created by Jordan Singer on 7/10/20.
//

import SwiftUI

struct ControlsGroup: View {
    @State private var vibrateOnRing = true
    @State private var selectedFlavor = Flavor.chocolate
    @State private var birthday = Date()
    @State private var volume = 50.0
    @State private var age = 0
    @State private var color = Color(.sRGB, red: 0, green: 0, blue: 0)

    var body: some View {
        Group {
            SectionView(title: "Toggle", description: "A control that toggles between on and off states.") {
                Toggle("Vibrate on Ring", isOn: $vibrateOnRing)
            }
            
            SectionView(title: "Picker", description: "A control for selecting from a set of mutually exclusive values.") {
                Group {
                    Picker("Flavor", selection: $selectedFlavor) {
                        Text("Chocolate").tag(Flavor.chocolate)
                        Text("Vanilla").tag(Flavor.vanilla)
                        Text("Strawberry").tag(Flavor.strawberry)
                    }
                    #if os(iOS) || os(OSX)
                    Picker("Flavor", selection: $selectedFlavor) {
                        Text("Chocolate").tag(Flavor.chocolate)
                        Text("Vanilla").tag(Flavor.vanilla)
                        Text("Strawberry").tag(Flavor.strawberry)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    #endif
                }
            }
            
            #if os(iOS) || os(OSX)
            SectionView(title: "DatePicker", description: "A control for selecting an absolute date.") {
                DatePicker(selection: $birthday, in: ...Date(), displayedComponents: .date) {
                    Text("Birthday")
                }
            }
            #endif
            
            SectionView(title: "Slider", description: "A control for selecting a value from a bounded linear range of values.") {
                Slider(value: $volume, in: 0...100)
            }
            
            #if os(iOS) || os(OSX)
            SectionView(title: "Stepper", description: "A control used to perform semantic increment and decrement actions.") {
                Stepper("Age: \(age)", value: $age, in: 0...100)
            }
            #endif
            
            #if os(iOS) || os(OSX)
            SectionView(title: "ColorPicker", description: "A control used to select a color from the system color picker UI.") {
                ColorPicker("Color", selection: $color)
            }
            #endif
        }
    }
}

enum Flavor: String, CaseIterable, Identifiable {
    case chocolate
    case vanilla
    case strawberry

    var id: String { self.rawValue }
}

struct ControlsGroup_Previews: PreviewProvider {
    static var previews: some View {
        ControlsGroup()
            .previewLayout(.sizeThatFits)
    }
}
