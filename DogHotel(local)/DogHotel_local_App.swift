//
//  DogHotel_local_App.swift
//  DogHotel(local)
//
//  Created by Sunny Hwang on 2023/04/06.
//

import SwiftUI

@main
struct DogHotel_local_App: App {
    var body: some Scene {
        WindowGroup {
            let ViewModel: ViewModel = ViewModel()
            ContentView()
                .environmentObject(ViewModel)
        }
    }
}
