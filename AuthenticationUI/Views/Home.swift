//
//  Home.swift
//  AuthenticationUI
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    // MARK: - Properties
    
    @State var show = false
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: SignUp(show: $show), isActive: $show) {
                    Text("")
                }
                .hidden()
                
                Login(show: $show)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}
