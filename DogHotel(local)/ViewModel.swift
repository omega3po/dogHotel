//
//  ViewModel.swift
//  DogHotel(local)
//
//  Created by Sunny Hwang on 2023/05/11.
//

import Foundation
import CoreLocation
import MapKit

class ViewModel: ObservableObject {
    let locationManager: CLLocationManager = CLLocationManager()
    @Published var hotelList: [HotelModel] = []
    @Published var hospitalList: [HospitalModel] = [HospitalModel(id: UUID(), hospitalName: "꿈사랑동물병원", hospitalAddress: "서울특별시", phoneNumber: "010-2929-2391", url: URL(string: "google.com")]
    
    func getHotel() {
        var currentLocation: CLLocationCoordinate2D = locationManager.location?.coordinate ?? CLLocationCoordinate2D(latitude: 127.123, longitude: 36.345)
        print(currentLocation)
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = "강아지 호텔"
        searchRequest.region = MKCoordinateRegion(center: currentLocation, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        var search = MKLocalSearch(request: searchRequest)
        search.start { response, error in
            guard let response = response else {
                // Handle the error.
                return
            }
            self.hotelList = [HotelModel]()
            for item in response.mapItems {
                print(item)
                if let name = item.placemark.name,let location = item.placemark.location, let phoneNumber = item.phoneNumber, let url = item.url {
                    self.hotelList.append(HotelModel(id: UUID(), hotelName: name, hotelAdress: item.placemark.title ?? "서울 지구방위본부", phoneNumber: phoneNumber, url: url))
                }
            }
        }
    }
    func getHospital() {
        var currentLocation: CLLocationCoordinate2D = locationManager.location?.coordinate ?? CLLocationCoordinate2D(latitude: 127.123, longitude: 36.345)
        print(currentLocation)
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = "동물병원"
        searchRequest.region = MKCoordinateRegion(center: currentLocation, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        var search = MKLocalSearch(request: searchRequest)
        search.start { response, error in
            guard let response = response else {
                // Handle the error.
                return
            }
            self.hospitalList = [HospitalModel]()
            for item in response.mapItems {
                if let name = item.placemark.name,let location = item.placemark.location, let phoneNumber = item.phoneNumber, let url = item.url {
                    self.hospitalList.append(HospitalModel(id: UUID(), hospitalName: name, hospitalAddress: item.placemark.title ?? "서울 지구방위본부", phoneNumber: phoneNumber, url: url))
                }
            }
        }
    }
}


