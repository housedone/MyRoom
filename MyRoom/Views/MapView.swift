//
//  MapView.swift
//  MyRoom
//
//  Created by 김우성 on 2021/11/03.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
           region = MKCoordinateRegion(
               center: coordinate,
               span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
           )
       }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 37.45528, longitude: 126.63748))
    }
}
