//
//  ButtonsGroup.swift
//  SwiftUI Kit
//
//  Created by Jordan Singer on 7/10/20.
//
import SwiftUI

struct ButtonsGroup: View {
    @State private var showingAlert = false
    @State private var showingSheet = false
    @State private var showingActionSheet = false
    
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
                            Alert(title: Text("Title"), message: Text("Message"), dismissButton: .default(Text("OK")))
                        }
                        
                        Button(action: {
                            self.showingSheet = true
                        }) {
                            Text("Show Sheet")
                        }.sheet(isPresented: $showingSheet) {
                            Text("Sheet")
                        }
                        
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
                    }
                }
            )
            
            SectionView(
                title: "Link",
                description: "A control for navigating to a URL.",
                content: {
                    Link("lil.software", destination: URL(string: "https://lil.software")!)
                }
            )
            
            SectionView(
                title: "NavigationLink",
                description: "A view that controls a navigation presentation.",
                content: {
                    NavigationLink(destination: Text("Destination")) {
                        Text("Next")
                    }
                }
            )
            
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
        }
    }
}

struct ButtonsGroup_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsGroup()
            .previewLayout(.sizeThatFits)
    }
}
