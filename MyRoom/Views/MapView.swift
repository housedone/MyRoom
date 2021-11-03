//
//  MapView.swift
//  MyRoom
//
//  Created by 김우성 on 2021/11/03.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.45528, longitude: 126.63748),
        span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        )
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
