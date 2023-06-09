//
//  NameAndType.swift
//  DogHotel(local)
//
//  Created by Sunny Hwang on 2023/04/28.
//

import SwiftUI

struct NameAndType: View {
    @State var dogName: String = ""
    @State var dogType: String = ""
    @State var tag: Int? = 0
    @State var isAppeared: Bool = false
    var body: some View {
        ZStack {
            Image("doghotel")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 10)
            VStack (spacing: 0) {
                Text("Name & Type")
                    .foregroundColor(.white)
                    .font(.system(size: 40,design: .rounded))
                    .padding(.top)
                    .bold()
                    .font(.system(size: 30))
                VStack {
                    SuperTextField(
                        placeholder: Text("강아지 이름").foregroundColor(.gray),
                        text: $dogName)
                        .autocapitalization(.none)
                        .autocorrectionDisabled(true)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("Color1"))
                        .cornerRadius(18)
                        .padding(.bottom, 7)
                        .padding(.horizontal, 16)
                    SuperTextField(
                        placeholder: Text("강아지 종류").foregroundColor(.gray),
                        text: $dogType)
                        .autocapitalization(.none)
                        .autocorrectionDisabled(true)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("Color1"))
                        .cornerRadius(18)
                        .padding(.vertical, 7)
                        .padding(.horizontal, 16)
                }
                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.24)
                
                ZStack {
                    NavigationLink(destination: DogAge(), tag: 1, selection: self.$tag) {
                        EmptyView()
                    }
                    .navigationTitle("강아지 이름")
                    HStack {
                        
                        Button {
                            
                            UserDefaults.standard.set(dogName, forKey: "dogName")
                            UserDefaults.standard.set(dogType, forKey: "dogType")
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
            }
            .padding()
            .background(Color("Color3").opacity(0.35))
            .cornerRadius(18)
            .offset(y: isAppeared ? 0 : -200)
            .navigationBarBackButtonHidden(true)
        }
        .onAppear(perform: {
            withAnimation(.spring()) {
                isAppeared = true
            }
        })
    }
}


struct NameAndType_Previews: PreviewProvider {
    static var previews: some View {
        NameAndType()
    }
}


