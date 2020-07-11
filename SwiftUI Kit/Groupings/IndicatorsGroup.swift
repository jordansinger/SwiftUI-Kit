//
//  IndicatorsGroup.swift
//  SwiftUI Kit
//
//  Created by Jordan Singer on 7/10/20.
//

import SwiftUI

struct IndicatorsGroup: View {
    @State private var progress = 0.5

    var body: some View {
        Group {
            SectionView(
                title: "ProgressView",
                description: "A view that shows the progress towards completion of a task.",
                content: {
                    Group {
                        ProgressView()
                        ProgressView(value: progress)
                    }
                }
            )
        }
    }
}

struct IndicatorsGroup_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorsGroup()
    }
}
