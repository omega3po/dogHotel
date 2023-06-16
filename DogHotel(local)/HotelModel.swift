//
//  HotelModel.swift
//  DogHotel(local)
//
//  Created by Sunny Hwang on 2023/05/11.
//

import Foundation

struct HotelModel: Identifiable, Codable {
    var id: UUID
    var hotelName: String
    var hotelAdress: String
    var phoneNumber: String
    var hotelURL: URL
}
