//
//  ControlsGroup.swift
//  SwiftUI Kit
//
//  Created by Jordan Singer on 7/10/20.
//

import SwiftUI

struct ControlsGroup: View {
    @State private var vibrateOnRing = true
    @State private var vibrateOnSilent = true
    @State private var selectedFlavor = Flavor.chocolate
    @State private var birthday = Date()
    @State private var alarm = Date()
    @State private var volume = 50.0
    @State private var rating = 5.0
    @State private var age = 0
    @State private var color = Color(.sRGB, red: 0, green: 0, blue: 0)

    var body: some View {
        Group {
            SectionView(title: "Toggle", description: "A control that toggles between on and off states. The default style is a switch on iOS, and a checkbox on macOS.") {
                Group {
                    Toggle("Vibrate on Ring", isOn: $vibrateOnRing)
                    
                    #if !os(tvOS)
                    Toggle("Vibrate on Silent", isOn: $vibrateOnSilent)
                        .toggleStyle(SwitchToggleStyle())
                    #endif
                }
            }
            
            SectionView(title: "Picker", description: "A control for selecting from a set of mutually exclusive values. The default style is usually a wheel on iOS; in a grouped list like this one it’s styled like a navigation link. The default style is a pop-up button on macOS.") {
                Group {
                    Picker("Flavor", selection: $selectedFlavor) {
                        ForEach(Flavor.allCases) { Text($0.description).tag($0) }
                    }
                    #if os(iOS) || os(OSX)
                    Picker("Flavor", selection: $selectedFlavor) {
                        ForEach(Flavor.allCases) { Text($0.description).tag($0) }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    #endif
                  
                    #if os(macOS)
                    Picker("Flavor", selection: $selectedFlavor) {
                        ForEach(Flavor.allCases) { Text($0.description).tag($0) }
                    }
                    .pickerStyle(RadioGroupPickerStyle())
                    #endif
                    
                    #if os(iOS)
                    Picker("Flavor", selection: $selectedFlavor) {
                        ForEach(Flavor.allCases) { Text($0.description).tag($0) }
                    }
                    .pickerStyle(WheelPickerStyle())
                    #endif
                }
            }
            
            #if os(iOS) || os(OSX)
            SectionView(title: "DatePicker", description: "A control for selecting an absolute date/time.") {
                Group {
                    DatePicker(selection: $birthday, in: ...Date(), displayedComponents: .date) {
                        Text("Birthday")
                    }

                    DatePicker("Alarm", selection: $alarm, displayedComponents: .hourAndMinute)
                }
            }
            #endif
            
            #if !os(tvOS)
            SectionView(title: "Slider", description: "A control for selecting a value from a bounded linear range of values. It can slide continuously, or snap to fixed increments.") {
                Group {
                    Slider(value: $volume, in: 0...100, minimumValueLabel: Text("0%"), maximumValueLabel: Text("100%"), label: { Text("Volume") })
                    
                    Slider(value: $rating, in: 1...10, step: 1, minimumValueLabel: Text("0"), maximumValueLabel: Text("10"), label: { Text("Rating") })
                }
            }
            #endif
            
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

enum Flavor: String, CaseIterable, Identifiable, CustomStringConvertible {
    case chocolate
    case vanilla
    case strawberry

    var id: String { self.rawValue }
    var description: String { self.rawValue.localizedCapitalized }
}

struct ControlsGroup_Previews: PreviewProvider {
    static var previews: some View {
        ControlsGroup()
            .previewLayout(.sizeThatFits)
    }
}
