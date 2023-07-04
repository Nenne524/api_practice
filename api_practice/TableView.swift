//
//  Search.swift
//  api_practice
//
//  Created by 山根愛実 on 2023/06/22.
//

import SwiftUI
import Foundation

struct Search: View {
    
    var body: some View {
        //Api_request(word: "733-0012")
        NavigationView {
            VStack {
                NavigationLink(destination: list_view()) {
                    Text("一覧")
                }
                NavigationLink(destination: post_view()) {
                    Text("投稿")
                }
            }
        }
    }
}
    
struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}

