//
//  MapView.swift
//  DogHotel(local)
//
//  Created by Sunny Hwang on 2023/05/11.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State var state: MapUserTrackingMode = .follow
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: CLLocationManager().location?.coordinate.latitude ?? 32.5666791, longitude: CLLocationManager().location?.coordinate.longitude ?? 126.9782914), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: $state)
        }
        .ignoresSafeArea(.all)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
