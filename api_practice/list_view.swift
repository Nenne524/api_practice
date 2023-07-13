//
//  list_view.swift
//  api_practice
//
//  Created by 山根愛実 on 2023/07/03.
//

import SwiftUI

struct list_view: View{
    @State var title: [String] = []
    //検索窓
    @State var SearchString: String = ""
    //検索フィルタ
    var filteredtitle: [String] {
            if SearchString.isEmpty {
                return title
            } else {
                return title.filter { $0.localizedCaseInsensitiveContains(SearchString) }
            }
        }

    var body: some View {
        List {
            ForEach(filteredtitle, id: \.self) { title_name in
                Text(title_name)
            }
        }
        .searchable(text: $SearchString, placement: .navigationBarDrawer(displayMode: .always), prompt: "search keyword")
        
        //onAppearは特定のviewが呼び出された直後に実行される
        //データを非同期で処理するとき使う
        .onAppear {
            Api_get { books_list in
                //ちゃんと返ってきてるか確認
                if let books = books_list {
                    let bookTitles = books.map { $0.title }//books_decodeからtitleの配列を取り出す
                        title = bookTitles // [String]型に変換して代入
                }
            }
        }
    }
}


struct list_view_Previews: PreviewProvider {
    static var previews: some View {
        list_view()
    }
}
