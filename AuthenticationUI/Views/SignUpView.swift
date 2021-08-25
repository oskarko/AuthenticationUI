//
//  SignUpView.swift
//  AuthenticationUI
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Firebase
import SwiftUI

struct SignUpView: View {
    
    // MARK: - Properties
    
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var isPasswordVisible = false
    @State var isConfirmPasswordVisible = false
    @Binding var show: Bool
    @State var alert = false
    @State var error = ""
    @AppStorage("status") var status: Bool = false
    
    
    // MARK: - View
    
    var body: some View {
        ZStack {
            ZStack(alignment: .topLeading) {
                
                GeometryReader { _ in
                    VStack {
                        Spacer()
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250.0, height: 235.0)
                        
                        Text("Register your account")
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
                                if isPasswordVisible {
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
                                isPasswordVisible.toggle()
                            }) {
                                Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(color)
                            }
                        } // HStack
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(!password.isEmpty ? Color.accentColor : color, lineWidth: 2)
                        )
                        .padding(.top, 25)
                        
                        HStack(spacing: 15) {
                            VStack {
                                if isConfirmPasswordVisible {
                                    TextField("Confirm password", text: $confirmPassword)
                                        .autocapitalization(.none)
                                        .textContentType(.oneTimeCode)
                                } else {
                                    SecureField("Confirm password", text: $confirmPassword)
                                        .autocapitalization(.none)
                                        .textContentType(.oneTimeCode)
                                }
                            } // VStack
                            
                            Button(action: {
                                isConfirmPasswordVisible.toggle()
                            }) {
                                Image(systemName: isConfirmPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(color)
                            }
                        } // HStack
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(!confirmPassword.isEmpty ? Color.accentColor : color, lineWidth: 2)
                        )
                        .padding(.top, 25)
                        
                        
                        Button(action: {
                            register()
                        }) {
                            Text("Register")
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
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.accentColor)
                }
                .padding()
                
            } // ZStack
            
            if alert {
                ErrorView(alert: $alert, error: $error)
            }
            
        } // ZStack
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    
    // MARK: - Helpers
    
    func register() {
        if !email.isEmpty {
            if !password.isEmpty && !confirmPassword.isEmpty && password == confirmPassword {
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    if let error = error {
                        self.error = error.localizedDescription
                        alert.toggle()
                    } else {
                        status = true
                    }
                }
            } else {
                error = "Password mismatch"
                alert.toggle()
            }
        } else {
            error = "Please fill all the contents properly"
            alert.toggle()
        }
    }
    
}

struct SignUpView_Previews: PreviewProvider {
    @State static var show = false
    
    static var previews: some View {
        SignUpView(show: $show)
    }
}
