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
                            Button {
                                print(hospital.hospitalURL)
                            }label: {
                                Text("URL Check")
                            }
                            NavigationLink {
                                WebView(request: URLRequest(url: hospital.hospitalURL))
                            } label: {
                                Text(hospital.phoneNumber)
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
    private func callNumber(phoneNumber:String) {
        if let phoneCallURL = URL(string: phoneNumber) {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
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
