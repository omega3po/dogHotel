//
//  Doggypital.swift
//  DogHotel(local)
//
//  Created by Sunny Hwang on 2023/04/27.
//

import SwiftUI
import CoreLocation

struct Doggypital: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(viewModel.hospitalList, id: \.id) { hospital in
                        VStack (alignment: .leading) {
                            HStack {
                                Text(hospital.hospitalName)
                                    .bold()
                                Spacer()
                            }
                            HStack {
                                Text(hospital.hospitalAddress)
                                    .foregroundColor(.secondary)
                                Spacer()
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .onAppear() {
            getAccess()
            viewModel.getHospital()
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

struct Doggypital_Previews: PreviewProvider {
    static var previews: some View {
        let ViewModel: ViewModel = ViewModel()
        Doggypital()
            .environmentObject(ViewModel)
    }
}
