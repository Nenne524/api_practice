//
//  list_view.swift
//  api_practice
//
//  Created by 山根愛実 on 2023/07/03.
//

import SwiftUI

struct list_view: View{
    @State var repositry: [String] = []
    //検索窓
    @State var SearchString: String = ""
    //検索フィルタ
    var filteredRepository: [String] {
            if SearchString.isEmpty {
                return repositry
            } else {
                return repositry.filter { $0.localizedCaseInsensitiveContains(SearchString) }
            }
        }

    
    var body: some View {
        List {
            
            ForEach(filteredRepository, id: \.self) { repo in
                Text(repo)
            }
        }
        .searchable(text: $SearchString, placement: .navigationBarDrawer(displayMode: .always), prompt: "search keyword")
        
        //onAppearは特定のviewが呼び出された直後に実行される
        //データを非同期で処理するとき使う
        .onAppear {
            Api_git { repos_list in
                if let repo_list = repos_list {
                    repositry = repo_list
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
