//
//  POST_View.swift
//  api_practice
//
//  Created by 山根愛実 on 2023/07/14.
//

import SwiftUI

struct POST_View: View {
    @State var title_in: String = ""
    var body: some View {
        VStack{
            HStack{
                TextField("題名を入力", text: $title_in)
                    .padding()
                    .background(Color(.systemGray6))
                    .padding()
            }
            Button("投稿"){
                Server_API_POST(title_post: title_in)
                title_in = ""
                Task {
                    do {
                        try await Server_API_GET()
                    } catch {
                        // Handle error
                        print(error)
                    }
                }
//                await Server_API_GET()
            }
        }
    }
}

struct POST_View_Previews: PreviewProvider {
    static var previews: some View {
        POST_View()
    }
}
