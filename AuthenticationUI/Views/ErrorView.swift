//
//  ErrorView.swift
//  AuthenticationUI
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import SwiftUI

struct ErrorView: View {
    
    // MARK: - Properties
    
    @State var color = Color.black.opacity(0.7)
    @Binding var alert: Bool
    @Binding var error: String
    
    // MARK: - Body
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    HStack {
                        Text("Error")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(color)
                        
                        Spacer()
                    } // HStack
                    .padding(.horizontal, 25)
                    
                    Text(error)
                        .foregroundColor(color)
                        .padding(.top)
                        .padding(.horizontal, 25)
                    
                    Button(action: {
                        alert.toggle()
                    }) {
                        Text("Cancel")
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 120)
                    } // Button
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    .padding(.top, 25)
                    
                } // VStack
                .padding(.vertical, 25)
                .frame(width: UIScreen.main.bounds.width - 70)
                .background(Color.white)
                .cornerRadius(15)
                
            } // VStack
            .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY)
            
        }
        .background(
            Color.black.opacity(0.35)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct ErrorView_Previews: PreviewProvider {
    @State static var alert = false
    @State static var error = "Please fill all the contents properly"
    
    static var previews: some View {
        ErrorView(alert: $alert, error: $error)
    }
}
