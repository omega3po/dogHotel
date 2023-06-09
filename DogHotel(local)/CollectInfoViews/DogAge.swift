//
//  DogAge.swift
//  DogHotel(local)
//
//  Created by Sunny Hwang on 2023/04/28.
//

import SwiftUI

struct DogAge: View {
    @State var dogAge: Float = 0
    @State var tag: Int? = 0
    @State var isAppeared: Bool = false
    var body: some View {
        ZStack {
            Image("doghotel")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 10)
            VStack {
                VStack {
                    VStack {
                        HStack {
                            Text("\(Int(dogAge))")
                                .font(.system(size: 100))
                                .bold()
                                .foregroundColor(.white)
                                .padding(.bottom, nil)
                            Text("살")
                                .bold()
                                .foregroundColor(.white)
                                .offset(y: 18)
                        }
                        
                        
                        Slider(value: $dogAge, in: 0 ... 25)
                        
                    }
                    .foregroundColor(.black)
                    .padding()
                    .background(Color("Color2"))
                    .cornerRadius(15)
                    .padding(.vertical, 7)
                    .padding(.top, 0)
                    .padding(.horizontal, 30)
                    .offset(y: -40)
                    
                }
                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.24)
                
                
                
                NavigationLink(destination: DogSize(), tag: 1, selection: self.$tag) {
                    EmptyView()
                }
                .navigationTitle("강아지 나이")
                HStack {
                    Button {
                        UserDefaults.standard.set(dogAge, forKey:"dogAge")
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
                        .padding(.horizontal, 16)
                        .offset(y: -15)
                    }
                }

            }
            .padding(.top, 70)
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

struct DogAge_Previews: PreviewProvider {
    static var previews: some View {
        DogAge()
    }
}
