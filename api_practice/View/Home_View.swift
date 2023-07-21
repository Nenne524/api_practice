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
            ZStack{
                TitleList_View()
                //POST_Button_View()
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar){
                    POST_Button_View()
                }
                ToolbarItem(placement: .navigation) {
                    Text("美鈴が丘町内会")
                        .font(.system(size: 30,weight: .thin))
                }
            }
            .toolbarColorScheme(.light)
            .toolbarBackground(.visible)
            //.toolbarBackground(Color.customBackgroundColor)
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
//            Text("投稿")
//                .font(.system(size:30, weight:.thin))
//                .frame(width: 90, height: 40)
//                .background(Color.white)
//                .foregroundColor(.black)
//                .cornerRadius(10)
            Image(systemName: "plus")
                .foregroundColor(.black)
        }
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
