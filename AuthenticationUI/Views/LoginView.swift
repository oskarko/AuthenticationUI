//
//  LoginView.swift
//  AuthenticationUI
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Firebase
import SwiftUI

struct LoginView: View {
    
    // MARK: - Properties
    
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var password = ""
    @State var isVisible = false
    @Binding var show: Bool
    @State var alert = false
    @State var error = ""
    
    // MARK: - View
    
    var body: some View {
        ZStack{
            ZStack(alignment: .topTrailing) {
                
                GeometryReader { _ in
                    VStack {
                        Spacer()
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250.0, height: 235.0)
                        
                        Text("Log in to your account")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(color)
                            .padding(.top, 35)
                        
                        TextField("Email", text: $email)
                            .autocapitalization(.none)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(!email.isEmpty ? Color.accentColor : color, lineWidth: 2)
                            )
                            .padding(.top, 25)
                        
                        HStack(spacing: 15) {
                            VStack {
                                if isVisible {
                                    TextField("Password", text: $password)
                                        .autocapitalization(.none)
                                        .textContentType(.oneTimeCode)
                                } else {
                                    SecureField("Password", text: $password)
                                        .autocapitalization(.none)
                                        .textContentType(.oneTimeCode)
                                }
                            } // VStack
                            
                            Button(action: {
                                isVisible.toggle()
                            }) {
                                Image(systemName: isVisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(color)
                            }
                        } // HStack
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(!password.isEmpty ? Color.accentColor : color, lineWidth: 2)
                        )
                        .padding(.top, 25)
                        
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                reset()
                            }) {
                                Text("Forget password")
                                    .fontWeight(.bold)
                                    .foregroundColor(.accentColor)
                            }
                        } // HStack
                        .padding(.top, 20)
                        
                        Button(action: {
                            verify()
                        }) {
                            Text("Log in")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        }
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .padding(.top, 25)
                        
                        Spacer()
                        
                    } // VStack
                    .padding(.horizontal, 25)
                } // GeometryReader
                
                Button(action: {
                    show.toggle()
                }) {
                    Text("Register")
                        .foregroundColor(.accentColor)
                        .fontWeight(.bold)
                }
                .padding()
                
            } // ZStack
            
            if alert {
                ErrorView(alert: $alert, error: $error)
            }
        } // ZStack
    }
    
    // MARK: - Helpers
    
    private func verify() {
        guard !email.isEmpty && !password.isEmpty else {
            error = "Please fill all the contents properly"
            alert.toggle()
            
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
                alert.toggle()
            } else {
                print("Login success!")
                UserDefaults.standard.setValue(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }
        }
    }
    
    private func reset() {
        guard !email.isEmpty else {
            self.error = "Email cannot be empty"
            alert.toggle()
            
            return
        }
        
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            guard let error = error else {
                self.error = "RESET"
                alert.toggle()
                
                return
            }
            
            self.error = error.localizedDescription
            alert.toggle()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    @State static var show = false
    
    static var previews: some View {
        LoginView(show: $show)
    }
}
