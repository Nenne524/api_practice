//
//  Yubin.swift
//  api_practice
//
//  Created by 山根愛実 on 2023/06/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct books: Encodable{
    //var id: Int?
    var title: String?
    var body: String?
//    var created_at: String?
//    var updated_at: String?
}

struct Status: Codable{
    var status: Int
    var massage: String?
    var results: [Add]
    
    
    struct Add: Codable{
        var zipcode: Int
        var prefcode: Int
        var address1: String
        var address2: String
        var address3: String
        var kana1: String
        var kana2: String
        var kana3: String
    }
}
