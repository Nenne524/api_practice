//
//  API_SubFetch.swift
//  
//
//  Created by 山根愛実 on 2023/07/21.
//

import Foundation
import SwiftUI

final class TitleList: ObservableObject{
    @Published var title: [String] = Realm_GET()
}

//ServerからフェッチしてRealmに入れる動作をまとめた
func TitleFetch(for titleList: TitleList) {
    Task {
        do {
            try await Server_API_GET()
            titleList.title = Realm_GET()
        } catch {
            print(error)
        }
    }
}
