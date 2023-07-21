//
//  TitleList_View.swift
//  api_practice
//
//  Created by 山根愛実 on 2023/07/14.
//

import SwiftUI

struct TitleList_View: View{
    @EnvironmentObject var titlelist: TitleList
    var body: some View {
        List {
            ForEach(titlelist.title.reversed(), id: \.self) { title_name in
                    Text(title_name)
                    .font(.title3)
                    .padding(10)
            }
        }
        .refreshable {
            do {
                try await Task.sleep(nanoseconds: 1 * 1000 * 1000 * 1000)
                TitleFetch(for: titlelist)
            } catch {
                print(error)
            }
        }
//        .scrollContentBackground(.hidden)
//        .background(Color.mint)
        
    }
}

struct TitleList_View_Previews: PreviewProvider {
    static var previews: some View {
        TitleList_View()
            .environmentObject(TitleList())
    }
}
