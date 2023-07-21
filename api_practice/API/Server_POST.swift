//
//  Server_POST.swift
//  api_practice
//
//  Created by 山根愛実 on 2023/07/14.
//

import Foundation
import SwiftUI

func Server_API_POST(title_post: String){
    let urlstring: String = "http://localhost:3000/books"
    guard let url = URL(string: urlstring) else{
        return
    }
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    
    let post = books_Encode(title: title_post)
    do {
        let jsonEncoder = JSONEncoder()
        let jsonData = try jsonEncoder.encode(post)
        request.httpBody = jsonData
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
    } catch {
        return
    }
    
    URLSession.shared.dataTask(with: request) {data, response, error in
        guard let _ = response else{
            return
        }
    }.resume()
}

//test練習用
func testtest(x: Int)->Int{
    return (x+1)
}
