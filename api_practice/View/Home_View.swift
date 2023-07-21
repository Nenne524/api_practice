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
        NavigationStack{
            VStack {
                TitleList_View()
                POST_Button_View()
            }
            .navigationBarTitle(Text("美鈴が丘"))
        }
    }
}

//"投稿"ボタンの実装
struct POST_Button_View: View {
    @State private var postButtonShowing: Bool = false
    var body: some View {
        Button(action:{
            self.postButtonShowing.toggle()
        }){
            Text("投稿")
        }
        .frame(width: 90,height: 50)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.blue, lineWidth: 1)
        )
        .fullScreenCover(isPresented: $postButtonShowing){
            POST_View(isActive: $postButtonShowing)
        }
        //テスト練習用
        .accessibilityIdentifier("投稿")
    }
}
    
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(TitleList())
    }
}
