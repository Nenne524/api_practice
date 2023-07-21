//
//  Server_GET.swift
//  api_practice
//
//  Created by 山根愛実 on 2023/07/14.
//

import Foundation
import SwiftUI
import RealmSwift

func Server_API_GET() async throws -> Void{
    let urlstring: String = "http://localhost:3000/books"
    guard let url = URL(string: urlstring) else{
        return
    }
    let (data, _) = try await URLSession.shared.data(from: url)
    do{
        let decoder = JSONDecoder()
        let books = try decoder.decode([books_Decode].self, from: data)
        Realm_POST_init()
        Realm_DELETE()
        Realm_POST(books: books)
    }catch{
        print("realm_error")
        return
    }
}
