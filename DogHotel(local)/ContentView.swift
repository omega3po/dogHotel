//
//  ContentView.swift
//  DogHotel(local)
//
//  Created by Sunny Hwang on 2023/04/06.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.dismiss) private var dismiss
    @State var showLogin: Bool = false
    @State var showRegister: Bool = false
    var btnBack : some View { Button(action: {
            dismiss()
            }) {
                HStack {
                Image("ic_back") // set image here
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    Text("Go back")
                }
            }
        }
    var body: some View {
        NavigationView {
            ZStack {
                ZStack {
                    Image("doghotel")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .blur(radius: (showLogin || showRegister) ? 8 : 0)
                }

                VStack (spacing: 0){
                    Spacer()
                    
                    HStack (spacing: -18){

                        Text("LOG IN")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .frame(width: 150, height: 50)
                            .background(showLogin ? Color("Color2") : Color("Color1"))
                            .cornerRadius(15)
                            .padding(20)
                            .onTapGesture {

                                withAnimation(.spring()) {
                                    showLogin.toggle()
                                    showRegister = false
                                }
                            }
                            
                    
                        
                        Text("REGISTER")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .frame(width: 150, height: 50)
                            .background(showRegister ? Color("Color2") : Color("Color1"))
                            .cornerRadius(15)
                            .padding(20)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    showRegister.toggle()
                                    showLogin = false
                                }
                            }

                    }
                    .frame(height: 80)
                    .background(Color("Color3"))
                    .cornerRadius(30)
                    
                }
                
                ZStack {
                    VStack {
                        LoginView()
                            .frame(width: UIScreen.main.bounds.width / 1.2, height: 345)
                            .background(Color("Color3").opacity(0.35))
                            .cornerRadius(18)
                            .offset(y: showLogin ? 0 : -200)
                            .opacity(showLogin ? 1 : 0)

                    }
                    VStack {
                        RegisterView()
                            .frame(width: UIScreen.main.bounds.width / 1.2, height: 400)
                            .background(Color("Color3").opacity(0.35))
                            .cornerRadius(18)
                            .offset(y: showRegister ? 0 : -200)
                            .opacity(showRegister ? 1 : 0)
                    }
                }
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ContentView()
        }
    }
}
