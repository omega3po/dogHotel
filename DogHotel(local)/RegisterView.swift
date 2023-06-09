//
//  RegisterView.swift
//  DogHotel(local)
//
//  Created by Sunny Hwang on 2023/04/13.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.dismiss) private var dismiss
    @State var email: String = ""
    @State var password: String = ""
    @State var id: String = ""
    @State var warning: String = ""
    @State var isAllSet: Bool = false
    @State var isFailed: Bool = false
    var body: some View {
        if !isAllSet {
            VStack(alignment: .center) {
                Text("Register")
                    .foregroundColor(.white)
                    .font(.system(size: 40,design: .rounded))
                    .padding()
                    .bold()
                    .font(.system(size: 30))
                SuperTextField(
                    placeholder: Text("Email").foregroundColor(.gray),
                    text: $email)
                    .autocapitalization(.none)
                    .autocorrectionDisabled(true)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color("Color1"))
                    .cornerRadius(18)
                    .padding(.vertical, 7)
                    .padding(.horizontal, 16)
                SuperTextField(
                    placeholder: Text("Password").foregroundColor(.gray),
                    text: $password)
                    .autocapitalization(.none)
                    .autocorrectionDisabled(true)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color("Color1"))
                    .cornerRadius(18)
                    .padding(.vertical, 7)
                    .padding(.horizontal, 16)
                SuperTextField(
                    placeholder: Text("ID").foregroundColor(.gray),
                    text: $id)
                    .autocapitalization(.none)
                    .autocorrectionDisabled(true)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color("Color1"))
                    .cornerRadius(18)
                    .padding(.vertical, 7)
                    .padding(.horizontal, 16)
                Button {
                    isFailed = true
                    warning = "this email is invalid"
                    if emailIsValid(email: email) {
                        if password.count < 5 {
                            warning = "password should be longer than 5"
                        } else {
                            warning = "this password is invalid"
                        }
                        if passwordIsValid(password: password){
                            warning = "this id is invalid"
                            if idIsValid(id: id){
                                isAllSet = true
                                UserDefaults.standard.set(email, forKey: "email")
                                UserDefaults.standard.set(password, forKey: "password")
                                UserDefaults.standard.set(id, forKey: "id")
                            }
                        }
                    }
                    
                    
                    
                } label:{
                    HStack {
                        Text("SIGN UP")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .padding()
                    }
                    .background(Color("Color3"))
                    .cornerRadius(10)
                    .padding(.horizontal, 16)
                }
                
                if isFailed {
                    Text(warning)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .padding()
                }
                Spacer()
            }
        }
        else {
            NavigationLink {
                NameAndType()
            } label: {
                Text("설문조사 시작")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding()
                    .foregroundColor(.white)
                    .background(Color("Color2"))
                    .cornerRadius(15)
            }
        }
        
    }
    func emailIsValid(email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        let result = test.evaluate(with: email)
        return result
    }
    func passwordIsValid(password: String) -> Bool {
        let regex = "[A-Z0-9a-z]{4,}"
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        let result = test.evaluate(with: password)
        return result
    }
    func idIsValid(id: String) -> Bool {
        let regex = "[A-Z0-9a-z]{1,}"
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        let result = test.evaluate(with: id)
        return result
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .previewLayout(.sizeThatFits)
    }
}
