//
//  Doggytel.swift
//  DogHotel(local)
//
//  Created by Sunny Hwang on 2023/04/27.
//

import SwiftUI
import CoreLocation

struct Doggytel: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        VStack {
            
            ScrollView {
                VStack {
                    ForEach(viewModel.hotelList, id: \.id) { hotel in
                        VStack (alignment: .leading) {
                            HStack {
                                Text(hotel.hotelName)
                                    .bold()
                                Spacer()
                            }
                            HStack {
                                Text(hotel.hotelAdress)
                                    .foregroundColor(.secondary)
                                Spacer()
                            }
                            NavigationLink {
                                WebView(request: URLRequest(url: hotel.hotelURL))
                            } label: {
                                Text(hotel.phoneNumber)
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .onAppear() {
            getAccess()
            viewModel.getHotel()
        }
    }
    
    func getAccess() {
        switch(CLLocationManager().authorizationStatus) {
        case .notDetermined:
            CLLocationManager().requestWhenInUseAuthorization()
        case .restricted:
            CLLocationManager().requestWhenInUseAuthorization()
        case .denied:
            CLLocationManager().requestWhenInUseAuthorization()
        case .authorizedAlways:
            CLLocationManager().requestWhenInUseAuthorization()
        case .authorizedWhenInUse:
            CLLocationManager().requestWhenInUseAuthorization()
        @unknown default:
            CLLocationManager().requestWhenInUseAuthorization()
        }
    }
    
}

struct Doggytel_Previews: PreviewProvider {
    static var previews: some View {
        let ViewModel: ViewModel = ViewModel()
        Doggytel()
            .environmentObject(ViewModel)
    }
}
