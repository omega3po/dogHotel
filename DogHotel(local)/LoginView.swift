//
//  LoginView.swift
//  DogHotel(local)
//
//  Created by Sunny Hwang on 2023/04/13.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) private var dismiss
    @State var email: String = ""
    @State var password: String = ""
    @State var warning: String = ""
    @State var isLoggedIn: Bool = false
    var body: some View {
        
        if !isLoggedIn {
            VStack(alignment: .center) {
                Text("Log In")
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
                Button {
                    warning = "this email is invalid"
                    let emailTyped: String = UserDefaults.standard.string(forKey: "email") ?? ""
                    let passwordTyped: String = UserDefaults.standard.string(forKey: "password") ?? ""
                    print(emailTyped + " " + email)
                    print(passwordTyped + " " + password)
                    
                    if emailIsValid(email: email) {
                        warning = "this password is invalid"
                        
                        if emailTyped == email && passwordTyped == password {
                            isLoggedIn = true
                        }
                    }
                } label:{
                    HStack {
                        
                        Text("Confirm")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .padding()
                        
                    }
                    .background(Color("Color3"))
                    .cornerRadius(10)
                    .padding(.horizontal, 16)
                }
                
                Text(warning)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                
            }
            .opacity(0.9)
        }
        
        else {
            NavigationLink {
                MainView()
            } label: {
                Text(UserDefaults.standard.string(forKey: "dogName") ?? "Continue")
                
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewLayout(.sizeThatFits)
    }
}
