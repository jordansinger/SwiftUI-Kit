//
//  ButtonModifiers.swift
//  SwiftUI Kit iOS
//
//  Created by Thomas Braun on 8/4/20.
//

import SwiftUI

struct ButtonStyleParams {
    let scale: Double
    let rotation: Double
    let blur: Double
    let color: Color
    let unpressedColor: Color
    let animate: Bool
    let response: Double
    let damping: Double
    let duration: Double
}

let DEFAULT_SCALE: Double = 0.85
let DEFAULT_ROTATION: Double = 0
let DEFAULT_BLUR: Double = 0
let DEFAULT_COLOR: Color = Color.primary.opacity(0.75)
let DEFAULT_ANIMATE: Bool = true
let DEFAULT_RESPONSE: Double = 0.35
let DEFAULT_DAMPING: Double = 0.35
let DEFAULT_DURATION: Double = 1
let DEFAULT_BUTTONCOLOR: Color = Color.black
let DEFAULT_TEXTCOLOR: Color = Color.white

struct ButtonModifiers: View {
    @State private var scale = DEFAULT_SCALE
    @State private var rotation = DEFAULT_ROTATION
    @State private var blur = DEFAULT_BLUR
    @State private var color = DEFAULT_COLOR
    @State private var buttonColor = DEFAULT_BUTTONCOLOR
    @State private var textColor = DEFAULT_TEXTCOLOR
    @State private var animate = DEFAULT_ANIMATE
    @State private var response = DEFAULT_RESPONSE
    @State private var damping = DEFAULT_DAMPING
    @State private var duration = DEFAULT_DURATION
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            HStack(spacing: 30) {
                Button(action: { }) {
                    Text("tap here")
                        .testButtonStyle(textColor: textColor)
                }
                .pressableButton(style: getParams())
                .foregroundColor(buttonColor)
                Button(action: { }) {
                    Text("or here")
                        .font(Font.body.bold())
                        .padding()
                }
                .pressableButton(style: getParams(), drawBackground: false)
                Button(action: { }) {
                    Image(systemName: "star.fill")
                        .testButtonStyle(textColor: textColor)
                }
                .pressableButton(style: getParams())
                .foregroundColor(buttonColor)
            }
            .zIndex(1)
            ScrollView {
                ScrollViewReader { reader in
                    VStack(alignment: .leading) {
                        Group {
                            Text("Scale Effect: \(scale * 100, specifier: "%.0f")%")
                                .font(Font.body.bold())
                            Slider(value: $scale, in: 0.05...2, step: 0.05)
                            Text("Rotation Effect: \(rotation, specifier: "%.0f") degrees")
                                .font(Font.body.bold())
                            Slider(value: $rotation, in: -360...360, step: 5)
                            Text("Blur Radius: \(blur, specifier: "%.1f")")
                                .font(Font.body.bold())
                            Slider(value: $blur, in: 0...15, step: 0.5)
                        }
                        Divider()
                        Group {
                            ColorPicker("Button Color", selection: $buttonColor)
                                .font(Font.body.bold())
                                .padding(.vertical)
                            ColorPicker("Button Text Color", selection: $textColor)
                                .font(Font.body.bold())
                                .padding(.vertical)
                            ColorPicker("Tap Color", selection: $color)
                                .font(Font.body.bold())
                                .padding(.vertical)
                        }
                        Divider()
                        Toggle("Animate", isOn: $animate.animation())
                            .font(Font.body.bold())
                            .toggleStyle(SwitchToggleStyle(tint: DEFAULT_COLOR))
                            .padding(.vertical)
                        if animate {
                            Text("Spring Stiffness: \(response, specifier: "%.2f")")
                                .font(Font.body.bold())
                            Slider(value: $response, in: 0...1, step: 0.05)
                            Text("(low for fast, high for slow)")
                                .font(Font.caption.bold())
                                .padding(.bottom, 10)
                            Text("Spring Damping: \(damping, specifier: "%.2f")")
                                .font(Font.body.bold())
                            Slider(value: $damping, in: 0.05...1, step: 0.05)
                            Text("(low for large bounce, high for small bounce)")
                                .font(Font.caption.bold())
                        }
                    }
                    .accentColor(DEFAULT_COLOR)
                    .padding(30)
                    .background(RoundedRectangle(cornerRadius: 30, style: .continuous)
                                    .foregroundColor(Color.primary.opacity(0.05)))
                    .padding()
                }
            }
        }
    }
    
    private func getParams() -> ButtonStyleParams {
        return ButtonStyleParams(scale: scale,
                                 rotation: rotation,
                                 blur: blur,
                                 color: color,
                                 unpressedColor: buttonColor,
                                 animate: animate,
                                 response: response,
                                 damping: damping,
                                 duration: duration)
    }
    
    
}


extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

// MARK: - Button

struct TestButton: ViewModifier {
    
    let textColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(Font.body.bold())
            .imageScale(.large)
            .padding()
            .foregroundColor(textColor)
        //			.colorInvert()
    }
}

extension Image {
    func testButtonStyle(textColor: Color) -> some View {
        self.modifier(TestButton(textColor: textColor))
    }
}

extension Text {
    func testButtonStyle(textColor: Color) -> some View {
        self.modifier(TestButton(textColor: textColor))
    }
}

struct ButtonPressedStyle: ButtonStyle {
    var style: ButtonStyleParams
    var drawBackground: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(Capsule()
                            .foregroundColor(configuration.isPressed ? style.color : style.unpressedColor)
                            .opacity(drawBackground ? 1 : 0))
            .scaleEffect(configuration.isPressed ? CGFloat(style.scale) : 1.0)
            .rotationEffect(.degrees(configuration.isPressed ? style.rotation : 0))
            .blur(radius: configuration.isPressed ? CGFloat(style.blur) : 0)
            .animation(style.animate ? Animation.spring(response: style.response, dampingFraction: style.damping, blendDuration: style.duration) : .none)
    }
}

extension Button {
    func pressableButton(style: ButtonStyleParams, drawBackground: Bool = true) -> some View {
        self.buttonStyle(ButtonPressedStyle(style: style, drawBackground: drawBackground))
    }
}
