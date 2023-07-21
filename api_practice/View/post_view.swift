//
//  POST_View.swift
//  api_practice
//
//  Created by 山根愛実 on 2023/07/14.
//

import SwiftUI

struct POST_View: View {
    @Binding var isActive: Bool
    @State var title_in: String = ""
    @EnvironmentObject var titlelist: TitleList
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("題名を入力", text: $title_in)
                    .padding()
                    .background(Color(.systemGray6))
                    .padding()
                
                Button("送信"){
                    Server_API_POST(title_post: title_in)
                    title_in = ""
                    isActive = false
                    TitleFetch(for: titlelist)
                }.accessibilityIdentifier("button")
                
            }
            .navigationBarItems(
                leading: Button("キャンセル") {
                    isActive = false
                    TitleFetch(for: titlelist)
                }
            )
        }
    }
}

struct POST_View_Previews: PreviewProvider {
    @State static var isActive = true
    static var previews: some View {
        POST_View(isActive: $isActive)
            .environmentObject(TitleList())
    }
}
