//
//  MyDog.swift
//  DogHotel(local)
//
//  Created by Sunny Hwang on 2023/04/27.
//

import SwiftUI

struct MyDog: View {
    var profileImage: Image = UserDefaults.standard.string(forKey: "pickedImage")?.generateThumbnail() ?? Image(systemName: "ant.circle")
    var dogName: String = UserDefaults.standard.string(forKey: "dogName") ?? "Dog Name"
    var dogType: String = UserDefaults.standard.string(forKey: "dogType") ?? "Dog Type"
    var dogAge: Int = UserDefaults.standard.integer(forKey: "dogAge")
    var dogSize: String = UserDefaults.standard.string(forKey: "dogSize") ?? "unknown"
    var noImportantPart: String = UserDefaults.standard.string(forKey: "noImportantPart") ?? "unknown"
    var userName: String = UserDefaults.standard.string(forKey: "id") ?? "unknown"
    var body: some View {
        VStack {
            List {
                // MARK: Dog Name and Type
                Section {
                    VStack (alignment: .leading) {
                        HStack {
                            profileImage
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                            VStack (alignment: .leading) {
                                Text(dogName)
                                    .font(.system(size: 27))
                                    .font(.headline)
                                
                                Text(dogType)
                                    .foregroundColor(.secondary)
                            }
                            
                            .padding(.horizontal)
                        }
                        
                        Divider()
                        
                        HStack {
                            Text("\(userName)'s dog")
                        }
                        
                    }
                    
                }
                
                // MARK: Dog Name and Type END

                
                Section {
                    HStack {
                        Text("\(dogAge)")
                    }
                } header: {
                    Text("Dog Age")
                }
                
                Section {
                    HStack {
                        Text(dogSize)
                    }
                } header: {
                    Text("Dog Size")
                }
                
                Section {
                    HStack {
                        Text(noImportantPart)
                    }
                } header: {
                    Text("중성화 여부")
                }
                
            }
            .shadow(radius: 10, x: 10, y: 10)
            .background {
                Image("doghotel")
                    .blur(radius: 10)
                    
            }
            .scrollContentBackground(.hidden)
        }
    }
}

struct MyDog_Previews: PreviewProvider {
    static var previews: some View {
        MyDog()
    }
}
