//
//  Realm.swift
//  api_practice
//
//  Created by 山根愛実 on 2023/07/13.
//

import Foundation
import RealmSwift

func Realm_GET() -> [String]{
    do{
        let realm = try Realm()
        let books = realm.objects(books_Realm.self)
        let titles = books.map { $0.title }
        return Array(titles)
    }catch{
        print("Realm_GET__Error")
        return []
    }
}
func Realm_POST_init(){
    do{
        let realm = try Realm()
        try realm.write {
            let book_realm = books_Realm(id: 1, title: "init", body: "init", created_at: "2023-07-13T08:08:31.339Z", updated_at: "2023-07-13T08:08:31.339Z")
            realm.add(book_realm, update: .modified)
        }
    }catch{
        print("Realm_POST_init__Error")
        return
    }
}

func Realm_POST(books: [books_Decode]){
    do{
        let realm = try Realm()
        try realm.write {
            for book in books {
                let book_realm = books_Realm(id: book.id, title: book.title, body: book.body, created_at: book.created_at, updated_at: book.updated_at)
                realm.add(book_realm, update: .modified)
            }
        }
    }catch{
        print("Realm_POST__Error")
        return
    }
}

func Realm_DELETE(){
    do{
        let realm = try Realm()
        try realm.write {
            realm.deleteAll()
        }
    }catch{
        print("Realm_DELETE__Error")
        return
    }
}
