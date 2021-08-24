//
//  Login.swift
//  AuthenticationUI
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import SwiftUI

struct Login: View {
    
    // MARK: - Properties
    
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var password = ""
    
    
    // MARK: - View
    
    var body: some View {
        VStack {
            Image("logo")
            
            Text("Log in to your account")
                .font(.title)
                .fontWeight(.bold)
        }
    }
}
