//
//  MainView.swift
//  DogHotel(local)
//
//  Created by Sunny Hwang on 2023/04/27.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Doggypital()
                .navigationTitle("Dog Hospital")
                .tag("hi")
                .tabItem {
                    Image(systemName: "stethoscope")
                    Text("Doggypital")
                    
                }
            MyDog()
                .navigationTitle("My Dog")
                .tag("bye")
                .tabItem {
                    Image(systemName: "pawprint")
                    Text("My Dog")
                }
            Doggytel()
                .navigationTitle("Dog Hotel")
                .tag("32")
                .tabItem {
                    Image(systemName: "bed.double")
                    Text("DoggyTel")
                }
        }
    }
}

