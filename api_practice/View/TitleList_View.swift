//
//  TitleList_View.swift
//  api_practice
//
//  Created by 山根愛実 on 2023/07/14.
//

import SwiftUI

struct TitleList_View: View{
    @State var title: [String] = []
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
        .onAppear {
            title = Realm_GET()
        }
    }
}


struct TitleList_View_Previews: PreviewProvider {
    static var previews: some View {
        TitleList_View()
    }
}

//struct list_view: View{
//    @State var title: [String] = []
//    //検索窓
//    @State var SearchString: String = ""
//    //検索フィルタ
//    var filteredtitle: [String] {
//            if SearchString.isEmpty {
//                return title
//            } else {
//                return title.filter { $0.localizedCaseInsensitiveContains(SearchString) }
//            }
//        }
//    var body: some View {
//        List {
//            ForEach(filteredtitle, id: \.self) { title_name in
//                Text(title_name)
//            }
//        }
//        .searchable(text: $SearchString, placement: .navigationBarDrawer(displayMode: .always), prompt: "search keyword")
//
//        //onAppearは特定のviewが呼び出された直後に実行される
//        .onAppear {
//            //間に合っていない？
//            Server_API_GET()
//            title = Realm_GET()
//            Api_get { books_list in
//                //ちゃんと返ってきてるか確認
//                if let books = books_list {
//                    let bookTitles = books.map { $0.title }//books_decodeからtitleの配列を取り出す
//                        title = bookTitles // [String]型に変換して代入
//                }
//            }
//        }
//    }
//}
