//
//  LearningApp.swift
//  Chris Module 5 L1 LearningApp
//
//  Created by October2022 on 8/4/23.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
