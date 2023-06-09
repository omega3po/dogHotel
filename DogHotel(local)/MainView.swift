//
//  MainView.swift
//  DogHotel(local)
//
//  Created by Sunny Hwang on 2023/04/27.
//

import SwiftUI

struct MainView: View {
    @State var tagNumber: Int = 1
    var body: some View {
        TabView(selection: $tagNumber) {
            Doggypital()
                .navigationTitle("Dog Hospital")
                .tag(0)
                .tabItem {
                    Image(systemName: "stethoscope")
                    Text("Doggypital")
                }
            MyDog()
                .navigationTitle("My Dog")
                .tag(1)
                .tabItem {
                    Image(systemName: "pawprint")
                    Text("My Dog")
                }
            Doggytel()
                .navigationTitle("Dog Hotel")
                .tag(2)
                .tabItem {
                    Image(systemName: "bed.double")
                    Text("DoggyTel")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

