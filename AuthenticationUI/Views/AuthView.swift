//
//  AuthView.swift
//  AuthenticationUI
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import SwiftUI

struct AuthView: View {
    
    // MARK: - Properties
    
    @State var show = false
    @AppStorage("status") var status: Bool = false
    
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            VStack {
                if status {
                    HomeView()
                } else {
                    ZStack {
                        NavigationLink(destination: SignUpView(show: $show), isActive: $show) {
                            Text("")
                        }
                        .hidden()
                        
                        LoginView(show: $show)
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    
    static var previews: some View {
        AuthView()
    }
}
