//
//  DogSize.swift
//  DogHotel(local)
//
//  Created by Sunny Hwang on 2023/05/16.
//

import SwiftUI

struct DogSize: View {
    @State var dogSize = "중형견"
    @State var tag: Int? = 0
    @State var isAppeared: Bool = false
    var sizes = ["소형견", "중형견", "대형견"]
    var body: some View {
        ZStack {
            Image("doghotel")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 10)
            VStack (spacing: 0){
                Text("Dog Size")
                    .foregroundColor(.white)
                    .font(.system(size: 40,design: .rounded))
                    .padding(30)
                    .bold()
                    .font(.system(size: 30))
                VStack {
                    Picker("hello World", selection: $dogSize) {
                        ForEach(sizes, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color("Color2"))
                    .cornerRadius(15)
                    .accentColor(.white)
                }
                .padding([.leading, .trailing, .bottom], 30)
                
                NavigationLink(destination: NoImportantPart(), tag: 1, selection: self.$tag) {
                    EmptyView()
                }
                .navigationTitle("강아지 크기")
                HStack {
                    Button {
                        UserDefaults.standard.set(dogSize, forKey: "dogSize")
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
                        .padding([.leading, .trailing, .bottom], 30)
                    }
                }
            }
            .background(Color("Color3").opacity(0.35))
            .cornerRadius(18)
            .offset(y: isAppeared ? 0 : -200)
        }
        .onAppear(perform: {
            withAnimation(.spring()){
                isAppeared = true
            }
        })
    }
}

struct DogSize_Previews: PreviewProvider {
    static var previews: some View {
        DogSize()
    }
}
