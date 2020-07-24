//
//  MapGroup.swift
//  SwiftUI Kit
//
//  Created by Steffen Kötte on 2020-07-21.
//

import MapKit
import SwiftUI

struct MapGroup: View {

    @State private var coordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.3348, longitude: -122.0090),
                                                             span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

    var body: some View {
        SectionView(
            title: "Map",
            description: "A map",
            content: {
                Map(coordinateRegion: $coordinateRegion)
                    .frame(minWidth: 200, idealWidth: 500, maxWidth: .infinity, minHeight: 200, idealHeight: 500, maxHeight: .infinity)
            }
        )
    }

}

struct MapGroup_Previews: PreviewProvider {
    static var previews: some View {
        MapGroup()
            .previewLayout(.sizeThatFits)
    }
}
