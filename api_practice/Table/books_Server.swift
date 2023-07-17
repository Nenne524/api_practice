//
//  books_Server.swift
//  api_practice
//
//  Created by 山根愛実 on 2023/07/14.
//

import Foundation

struct books_Encode: Encodable{
    var title: String?
    var body: String?
}
struct books_Decode: Decodable{
    var id: Int
    var title: String
    var body: String?
    var created_at: String
    var updated_at: String
}
