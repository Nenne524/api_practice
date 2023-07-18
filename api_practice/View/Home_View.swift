//
//  Home_View.swift
//  api_practice
//
//  Created by 山根愛実 on 2023/07/14.
//

import SwiftUI
import Foundation

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                TitleList_View()
                NavigationLink(destination: POST_View()) {
                    Text("投稿")
                }
            }
        }
    }
}
    
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
