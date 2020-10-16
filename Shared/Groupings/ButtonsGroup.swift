//
//  ButtonsGroup.swift
//  SwiftUI Kit
//
//  Created by Jordan Singer on 7/10/20.
//
import SwiftUI
import AuthenticationServices

struct ButtonsGroup: View {
    @State private var showingAlert = false
    @State private var showingSheet = false
    @State private var showingActionSheet = false
    @State private var showButtonSheet = false
    
    var body: some View {
        Group {
            SectionView(
                title: "Button",
                description: "A control that performs an action when triggered.",
                content: {
                    Group {
                        Button(action: {
                            self.showingAlert = true
                        }) {
                            Text("Show Alert")
                        }
                        .alert(isPresented: $showingAlert) {
                            Alert(
                                title: Text("Title"),
                                message: Text("Message"),
                                primaryButton: .default(Text("Confirm")),
                                secondaryButton: .cancel()
                            )
                        }
                        
                        Button(action: {
                            self.showingSheet = true
                        }) {
                            Text("Show Sheet")
                        }.sheet(isPresented: $showingSheet) {
                            Text("Sheet").padding()
                            #if os(macOS)
                            Button("Close") {
                                showingSheet.toggle()
                            }.padding()
                            #endif
                        }
                        
                        #if !os(OSX)
                        Button(action: {
                            self.showingActionSheet = true
                        }) {
                            Text("Show Action Sheet")
                        }
                        .actionSheet(isPresented: $showingActionSheet) {
                            ActionSheet(title: Text("Title"), message: Text("Message"), buttons: [
                                .destructive(Text("Delete")),
                                .default(Text("Option 1")) { },
                                .default((Text("Option 2"))) { },
                                .cancel()
                            ])
                        }
                        #endif
                    }
                }
            )
            
            #if !os(watchOS) && !os(tvOS)
            SectionView(
                title: "Link",
                description: "A control for navigating to a URL.",
                content: {
                    Link("lil.software", destination: URL(string: "https://lil.software")!)
                }
            )
            #endif
            
            #if !os(watchOS)
            SectionView(
                title: "Menu",
                description: "A control for presenting a contextually-appropriate menu of buttons.",
                content: {
                    Group {
                        #if !os(tvOS)
                        Menu("Show Menu") {
                            Button("Button") {}
                            Button("Button") {}
                            Menu("Submenu") {
                                Button("Button") {}
                                Button("Button") {}
                                Button("Button") {}
                            }
                            Divider()
                            Button("Button") {}
                            Menu("Submenu") {
                                Button("Button") {}
                                Button("Button") {}
                                Button("Button") {}
                            }
                        }
                        #endif
                        HStack {
                            #if os(iOS)
                            Text("Show Context Menu")
                            Spacer()
                            Text("Press & hold").italic().foregroundColor(.secondary)
                            #elseif os(tvOS)
                            Button("Press & hold") {}
                            #elseif os(macOS)
                            Text("Right click")
                            #endif
                        }
                        .contextMenu {
                            Button("Button") {}
                            Button("Button") {}
                            Button("Button") {}
                            Divider()
                            Button("Button") {}
                            Button("Button") {}
                        }
                    }
                }
            )
            #endif
            
            SectionView(
                title: "NavigationLink",
                description: "A view that controls a navigation presentation.",
                content: {
                    NavigationLink(destination: Text("Destination")) {
                        Text("Next")
                    }
                }
            )
            
            #if os(iOS) || os(OSX)
            SectionView(
                title: "SignInWithAppleButton",
                description: "A control that you add to your interface to allow users to sign in with their Apple ID.",
                content: {
                    SignInWithAppleButton(
                        .signIn,
                        onRequest: { request in
                            request.requestedScopes = [.fullName, .email]
                        },
                        onCompletion: { result in
                            
                        }
                    )
                }
            )
            #endif
            
            #if os(iOS)
            SectionView(
                title: "Custom Button Views",
                description: "Customize what buttons look like",
                content: {
                    Button(action: {
                        self.showButtonSheet = true
                    }) {
                        Text("Show Button Modifiers")
                    }.sheet(isPresented: $showButtonSheet) {
                        ButtonModifiers().padding()
                        #if os(macOS)
                        Button("Close") {
                            showButtonSheet.toggle()
                        }.padding()
                        #endif
                    }
                }
                
            )
            #endif
        }
    }
}

struct ButtonsGroup_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsGroup()
            .previewLayout(.sizeThatFits)
    }
}
