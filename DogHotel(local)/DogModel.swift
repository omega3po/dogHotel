//
//  DogModel.swift
//  DogHotel(local)
//
//  Created by Sunny Hwang on 2023/05/12.
//

import Foundation

struct DogModel: Identifiable, Codable {
    var id: UUID
    var dogName: String
    var dogType: String
}
