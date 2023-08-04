//
//  HomeView.swift
//  Chris Module 5 L1 LearningApp
//
//  Created by October2022 on 8/4/23.
//

import SwiftUI

struct HomeView: View {
    
   @EnvironmentObject var model: ContentModel
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
