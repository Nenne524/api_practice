//
//  api_practiceApp.swift
//  api_practice
//
//  Created by 山根愛実 on 2023/06/22.
//

import SwiftUI

@main
struct api_practiceApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(TitleList())
        }
    }
}
