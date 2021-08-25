//
//  HomeView.swift
//  AuthenticationUI
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    
    @State var show = false
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: SignUpView(show: $show), isActive: $show) {
                    Text("")
                }
                .hidden()
                
                LoginView(show: $show)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
    }
}
