//
//  InfoView.swift
//  DogHotel(local)
//
//  Created by Sunny Hwang on 2023/04/20.
//

import SwiftUI

struct InfoViews: View {
    @State var dogAge: Float = 0
    @State var dogSize: String = "중형견"
    @State var dogImportantPart: String = "함"
    @State var showPicker: Bool = false
    @State var pickedImage: Image?
    @State var localIdentifier: String? = ""
    var sizes = ["소형견", "중형견", "대형견"]
    var noImpotantPart = ["함", "안함"]
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .white
    }
    var body: some View {
        VStack {
            
            VStack {
                Text("강아지 크기")
                    .foregroundColor(.white)
                    .bold()
                    .padding(.top, 20)
                Picker("Choose a size", selection: $dogSize) {
                    ForEach(sizes, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .padding([.bottom, .leading, .trailing], 16)
                Text("중성화 여부")
                    .foregroundColor(.white)
                    .bold()
                Picker("중성화 여부", selection: $dogImportantPart) {
                    ForEach(noImpotantPart, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .padding([.bottom, .leading, .trailing], 16)
            }
            .background(Color("BorderColor"))
            .cornerRadius(17)
            .padding()
            
            Button {
                showPicker.toggle()
            } label: {
                if !showPicker {
                    HStack {
                        Image(systemName: "photo")
                            .font(.system(size: 30))
                        Text("강아지 사진을 선택하시오")
                    }
                }
            }
            .sheet(isPresented: $showPicker) {
                PhpViewControllerRepresentable() { image, local in
                    self.pickedImage = Image(uiImage: image)
                    self.localIdentifier=local
                    UserDefaults.standard.set(localIdentifier, forKey: "pickedImage")
                }
            }
            localIdentifier?.generateThumbnail()?
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.height / 7 ,height: UIScreen.main.bounds.height / 7)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.ultraThinMaterial, lineWidth: 10))
                .cornerRadius(10)
                .padding()
            
            NavigationLink(destination: MainView()) {
                Text("Confirm")
            }

            Spacer()
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoViews()
    }
}
