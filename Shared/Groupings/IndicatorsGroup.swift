//
//  IndicatorsGroup.swift
//  SwiftUI Kit
//
//  Created by Jordan Singer on 7/10/20.
//

import SwiftUI

struct IndicatorsGroup: View {
    @State private var progressAmount = 0.0
    @State private var progress = 0.5
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Group {
            SectionView(
                title: "ProgressView",
                description: "A view that shows the progress towards completion of a task.",
                content: {
                    Group {
                        ProgressView()
                        VStack {
                            ProgressView("Downloading…", value: progressAmount, total: 100)
                        }
                        .onReceive(timer) { _ in
                            if progressAmount < 100 {
                                progressAmount += 2
                            } else {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    progressAmount = 0.0
                                }
                                
                            }
                        }
                        #if os(watchOS)
                        ProgressView(value: progress)
                            .progressViewStyle(CircularProgressViewStyle())
                        #endif
                    }
                }
            )
            
            #if os(watchOS)
            SectionView(
                title: "Gauge",
                description: "A view that shows a value within a range.",
                content: {
                    Gauge(value: progress, label: { Label("Progress", systemImage: "clock") })
                }
            )
            #endif
        }
    }
}

struct IndicatorsGroup_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorsGroup()
            .previewLayout(.sizeThatFits)
    }
}
