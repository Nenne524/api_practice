//
//  Api_post.swift
//  api_practice
//
//  Created by 山根愛実 on 2023/07/04.
//

import Foundation
import SwiftUI

func api_post(title_post: String){
    let urlstring: String = "http://localhost:3000/books"
    guard let url = URL(string: urlstring) else{
        return
    }
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    
    let post = books(title: title_post)
    do {
        let jsonEncoder = JSONEncoder()
        let jsonData = try jsonEncoder.encode(post)
        //let jsonstr:String = String(data: jsonData, encoding: .utf8)!
        //print(jsonstr)
        request.httpBody = jsonData
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        
    } catch {
        print("error")
        return
    }
        
    URLSession.shared.dataTask(with: request) {data, response, error in
        guard let _ = response else{
            return
        }
        //print("response: \(String(describing: response))")
    }.resume()
}
