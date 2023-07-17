//
//  books_struct.swift
//  api_practice
//
//  Created by 山根愛実 on 2023/07/07.
//

import Foundation

struct books: Encodable{
    var title: String?
    var body: String?
}
struct books_decode: Decodable{
    var id: Int
    var title: String
    var body: String?
    var created_at: String
    var updated_at: String
}
