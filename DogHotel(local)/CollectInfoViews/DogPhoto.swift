//
//  DogPhoto.swift
//  DogHotel(local)
//
//  Created by Sunny Hwang on 2023/05/26.
//

import SwiftUI

struct DogPhoto: View {
    @State var showPicker: Bool = false
    @State var localIdentifier: String? = ""
    @State var pickedImage: Image?
    @State var imageIsSelected: Bool = false
    @State var tag: Int? = 0
    var body: some View {
        VStack {
            VStack {
                if !imageIsSelected {
                    Image(systemName: "photo")
                        .font(.system(size: 220))
                        .foregroundColor(.black)
                        .padding()
                } else {
                    localIdentifier?.generateThumbnail()?
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.height / 3 ,height: UIScreen.main.bounds.height / 3)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.ultraThinMaterial, lineWidth: 10))
                        .cornerRadius(10)
                        .padding()
                }
                
                
            }
            .border(.black, width: 8)
            .background(.white)
            
            
            Button {
                showPicker.toggle()
            } label: {
                if !showPicker {
                    HStack {
                        Image(systemName: "pawprint.circle")
                            .font(.system(size: 40))
                        Text("Choose Dog Photo")
                            .font(.system(size: 30))
                    }
                    .underline()
                    .padding()
                }
            }
            .sheet(isPresented: $showPicker) {
                PhpViewControllerRepresentable() { image, local in
                    self.pickedImage = Image(uiImage: image)
                    self.localIdentifier=local
                    UserDefaults.standard.set(localIdentifier, forKey: "pickedImage")
                    imageIsSelected = true
                }
            }
            
            
            Button {
                
            } label: {
                if !showPicker {
                    if !imageIsSelected {
                        Text("skip")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                        
                        
                    }
                }
            }
            .padding()
            
            NavigationLink(destination: MainView().navigationBarBackButtonHidden(true), tag: 1, selection: self.$tag){
                EmptyView()
            }
            .navigationTitle("강아지 사진")
            Button {
                UserDefaults.standard.set(true, forKey: "isNotFirstTime")
                self.tag = 1
            } label: {
                if imageIsSelected {
                    Text("Done")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .padding(.horizontal, 50)
                        .padding(.vertical, 20)
                        .background(.black)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 2))
                }
            }
            Spacer()
        }
    }
}

struct DogPhoto_Previews: PreviewProvider {
    static var previews: some View {
        DogPhoto()
    }
}
