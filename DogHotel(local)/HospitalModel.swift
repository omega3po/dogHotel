//
//  HospitalModel.swift
//  DogHotel(local)
//
//  Created by Sunny Hwang on 2023/06/09.
//

import Foundation

struct HospitalModel: Identifiable, Codable{
    var id: UUID
    var hospitalName: String
    var hospitalAddress: String
}
