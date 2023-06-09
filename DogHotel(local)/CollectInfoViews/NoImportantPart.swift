//
//  NoImportantPart.swift
//  DogHotel(local)
//
//  Created by Sunny Hwang on 2023/05/26.
//

import SwiftUI

struct NoImportantPart: View {
    @State var tag: Int? = 0
    @State var noImportantPart: String = "함"
    @State var isAppeared: Bool = false
    var noImpotantPartList = ["함", "안함"]
    var body: some View {
        ZStack {
            Image("doghotel")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 10)
            VStack {
                Text("중성화 여부")
                    .foregroundColor(.white)
                    .font(.system(size: 40,design: .rounded))
                    .padding(30)
                    .bold()
                    .font(.system(size: 30))
                Picker("hello World", selection: $noImportantPart) {
                    ForEach(noImpotantPartList, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .foregroundColor(.black)
                .font(.system(size: 100))
                .background(Color("Color2"))
                NavigationLink(destination: DogPhoto(), tag: 1, selection: self.$tag) {
                    EmptyView()
                }
                .navigationTitle("강아지 중성화")
                HStack {
                    Button {
                        UserDefaults.standard.set(noImportantPart, forKey: "noImportantPart")
                        self.tag = 1
                    } label: {
                        HStack {
                            Text("다음")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .padding()
                        }
                        .background(Color("Color0"))
                        .cornerRadius(10)
                    }
                }
            }
            .frame(width: 250, height: 200)
            .background(Color("Color3").opacity(0.35))
            .cornerRadius(18)
        }
    }
}

struct NoImportantPart_Previews: PreviewProvider {
    static var previews: some View {
        NoImportantPart()
    }
}
