//
//  post_view.swift
//  api_practice
//
//  Created by 山根愛実 on 2023/07/04.
//

import SwiftUI

struct post_view: View {
    @State var title_in: String = ""
    var body: some View {
        HStack{
            TextField("題名を入力", text: $title_in)
                .padding()
                .background(Color(.systemGray6))
                .padding()
        }
    }
}

struct post_view_Previews: PreviewProvider {
    static var previews: some View {
        post_view()
    }
}
