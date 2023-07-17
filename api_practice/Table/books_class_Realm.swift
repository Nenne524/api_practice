//
//  books_class_Realm.swift
//  api_practice
//
//  Created by 山根愛実 on 2023/07/13.
//

import Foundation
import RealmSwift

class books_Realm: Object{
    @Persisted (primaryKey: true) var id: Int
    @Persisted var title: String
    @Persisted var body: String?
    @Persisted var created_at: String
    @Persisted var updated_at: String
    
    convenience init(id: Int, title: String, body: String?, created_at: String, updated_at: String) {
        self.init()
        self.id = id
        self.title = title
        self.body = body
        self.created_at = created_at
        self.updated_at = updated_at
    }
}
