//
//  POST_Button_View.swift
//  api_practice
//
//  Created by 山根愛実 on 2023/07/19.
//

import SwiftUI

struct POST_Button_View: View {
    @State private var postButtonShowing: Bool = false
    var body: some View {
        Button(action:{
            self.postButtonShowing.toggle()
        }){
            Text("投稿")
                .font(.title)
        }
        .fullScreenCover(isPresented: $postButtonShowing){
            POST_View(isActive: $postButtonShowing)
        }
        .frame(width: 100,height: 50)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.blue, lineWidth: 1)
        )
        .padding(5)
        .accessibilityIdentifier("投稿")
    }
}

struct POST_Button_View_Previews: PreviewProvider {
    static var previews: some View {
        POST_Button_View()
    }
}
