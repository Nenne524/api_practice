//
//  Realm_GET.swift
//  api_practice
//
//  Created by 山根愛実 on 2023/07/14.
//

import Foundation
import RealmSwift

func Realm_api() -> [String]{
    do{
        let realm = try Realm()
        let books = realm.objects(books_Realm.self)
        let titles = books.map { $0.title }
        return Array(titles)
    }catch{
        print("Realm_api__Error")
        return []
    }
}
