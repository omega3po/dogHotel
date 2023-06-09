//
//  FuckingTest.swift
//  DogHotel(local)
//
//  Created by Sunny Hwang on 2023/06/05.
//

import SwiftUI

struct FuckingTest: View {
    @State var showText: Bool = false
    let boolValue = false
    var body: some View {
        NavigationView {
            
            NavigationLink {
                if boolValue {
                    
                }
                else {
                    Text("hello 2")
                }
            } label: {
                Text("Button To hello 1")
            }
            
        }
    }
}

struct FuckingTest_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FuckingTest()
        }
    }
}
