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
            Section(footer: Text("A control that toggles between on and off states.")) {
                Text("Toggle")
                    .font(.headline)
                Toggle("Vibrate on Ring", isOn: $vibrateOnRing)
            }
            
            Section(footer: Text("A control for selecting from a set of mutually exclusive values.")) {
                Text("Picker")
                    .font(.headline)
                
                Picker("Flavor", selection: $selectedFlavor) {
                    Text("Chocolate").tag(Flavor.chocolate)
                    Text("Vanilla").tag(Flavor.vanilla)
                    Text("Strawberry").tag(Flavor.strawberry)
                }

                Picker("Flavor", selection: $selectedFlavor) {
                    Text("Chocolate").tag(Flavor.chocolate)
                    Text("Vanilla").tag(Flavor.vanilla)
                    Text("Strawberry").tag(Flavor.strawberry)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(footer: Text("A control for selecting an absolute date.")) {
                Text("DatePicker")
                    .font(.headline)
                
                DatePicker(selection: $birthday, in: ...Date(), displayedComponents: .date) {
                    Text("Birthday")
                }
            }
            
            Section(footer: Text("A control for selecting a value from a bounded linear range of values.")) {
                Text("Slider")
                    .font(.headline)
                Slider(value: $volume, in: 0...100)
            }
            
            Section(footer: Text("A control used to perform semantic increment and decrement actions.")) {
                Text("Stepper")
                    .font(.headline)
                Stepper("Age: \(age)", value: $age, in: 0...100)
            }
            
            Section(footer: Text("A control used to select a color from the system color picker UI.")) {
                Text("ColorPicker")
                    .font(.headline)
                ColorPicker("Color", selection: $color)
            }
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
    }
}
