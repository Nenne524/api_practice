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

//Realmを通さない版
//func Api_get(completion: @escaping ([books_decode]?) -> Void){
//    let urlstring: String = "http://localhost:3000/books"
//    guard let url = URL(string: urlstring) else{
//        completion(nil)
//        return
//    }
//    let request = URLRequest(url: url)
//
//    //アクセスしてレスポンスを受け取る
//    URLSession.shared.dataTask(with: request){ data,res,err in
//        guard let data = data else{
//            completion(nil)
//        }
//        do{
//            let books = try JSONDecoder().decode([books_decode].self,from: data)
//            completion(books)
//            return
//        }catch{
//            print("realm_error")
//            completion(nil)
//            return
//        }
//    }
//    .resume()
//}


//Decodeが古い版
//func Api_request(word: String){
//    //var repo: [[String: Any]]=[]
//    var task: URLSessionTask
//    //var word: String!
//    //var url: String!
//    //var idx: Int!
//
//    let apiurl = URL(string: "https://zipcloud.ibsnet.co.jp/api/search?zipcode=\(word)")
//    let request = URLRequest(url: apiurl!)
//    task = URLSession.shared.dataTask(with: request){ (data, res, err) in
//        do{
//            guard let response = res as? HTTPURLResponse else{
//                print("error")
//                return
//            }
//            print("response.statusCode = \(response.statusCode)")
//
//            if let obj = try JSONSerialization.jsonObject(with: data!) as? [String: Any] {
//                print(obj)
//                if let items = obj["results"] as? [[String: Any]] {
//                    //print(items)
//                    //print(items[0])
//                    if let kana3 = items[0]["kana3"] as? String{
//                        print(kana3)
//                    }
//                }
//            }
////            let decoder: JSONDecoder = JSONDecoder()
////            let add:Status = try decoder.decode(Status.self, from: data!)
////            print(add.results[0].address1)
//            //decodeができていない。確かに、resultとか指定してないけどどうすりゃええんや<zaki5m>
//        }catch{
//            print("error2")
//        }
//    }
//    // これ呼ばなきゃリストが更新されません
//    task.resume()
//}
