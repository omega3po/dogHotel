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
    @Published var hotelList = [HotelModel(id: UUID(), hotelName: "Shinla", hotelAdress: "Seoul LA"), HotelModel(id: UUID(), hotelName: "Lotte", hotelAdress: "GangNam")]
    @Published var hospitalList = [HospitalModel(id: UUID(), hospitalName: "참사랑 동물병원", hospitalAddress: "Seoul GangNam"), HospitalModel(id: UUID(), hospitalName: "거짓사랑 동물병원", hospitalAddress: "Seoul GangNam")]
    
    func getHotel() {
        var currentLocation: CLLocationCoordinate2D = locationManager.location?.coordinate ?? CLLocationCoordinate2D(latitude: 127.123, longitude: 36.345)
        print(currentLocation)
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = "dog hotel"
        searchRequest.region = MKCoordinateRegion(center: currentLocation, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        var search = MKLocalSearch(request: searchRequest)
        search.start { response, error in
            guard let response = response else {
                // Handle the error.
                return
            }
            self.hotelList = [HotelModel]()
            for item in response.mapItems {
                if let name = item.placemark.name,let location = item.placemark.location {
                    self.hotelList.append(HotelModel(id: UUID(), hotelName: name, hotelAdress: item.placemark.title ?? "서울 지구방위본부"))
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
                if let name = item.placemark.name,let location = item.placemark.location {
                    self.hospitalList.append(HospitalModel(id: UUID(), hospitalName: name, hospitalAdress: item.placemark.title ?? "서울 지구방위본부"))
                }
            }
        }
    }
}


