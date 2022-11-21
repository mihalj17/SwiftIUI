//
//  WelcomeView.swift
//  Project19
//
//  Created by Matko Mihaljl on 11.10.2022..
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        Text("Welcome to SnowSeeker")
            .font(.largeTitle)
        
        Text("Plesase select aa resort from the lleft-hand menu")
            .foregroundColor(.secondary)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
