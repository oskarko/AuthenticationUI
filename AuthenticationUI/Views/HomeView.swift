//
//  HomeView.swift
//  AuthenticationUI
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Firebase
import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    
    // MARK: - Body
    
    var body: some View {
        Text("Hello, World!")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color.black.opacity(0.7))
        
        Button(action: {
            try! Auth.auth().signOut()
            UserDefaults.standard.setValue(false, forKey: "status")
        }) {
            Text("Log out")
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 50)
        }
        .background(Color.accentColor)
        .cornerRadius(10)
        .padding(.top, 25)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
