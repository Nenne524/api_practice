//
//  Api_Get.swift
//  api_practice
//
//  Created by 山根愛実 on 2023/07/07.
//

import Foundation
import SwiftUI

//URLSession.shared.dataTaskが非同期処理だからコールバック関数(?)にしないといけない？(completion)
//@escapingはクロージャが関数のスコープを超えて保持または使用される場合に使用される属性
func Api_get(completion: @escaping ([books_decode]?) -> Void){
    let urlstring: String = "http://localhost:3000/books"
    guard let url = URL(string: urlstring) else{
        completion(nil)
        return
    }
    let request = URLRequest(url: url)
    
    //アクセスしてレスポンスを受け取る
    URLSession.shared.dataTask(with: request){ data,res,err in
        //dataの強制アンラップ防止
        guard let data = data else{
            completion(nil)
            return
        }
        do{
            let books = try JSONDecoder().decode([books_decode].self,from: data)
            completion(books)
        }catch{
            completion(nil)
            return
        }

    }
    .resume()
}

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
