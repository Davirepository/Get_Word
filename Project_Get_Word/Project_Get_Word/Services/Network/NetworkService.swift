//
//  NetworkService.swift
//  Project_Get_Word
//
//  Created by Давид on 29/11/2019.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

class NetworkService {
    private let baseurl = URL(string: "http://localhost:8080/")!
    
    func loadCategories(completion: @escaping ([Category]?) -> Void) {
        let url = baseurl.appendingPathComponent("categories")
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print(#line, #function, "Cant get data from \(url.absoluteString)")
                completion(nil)
                return
            }
            
            let jsonDecoder = JSONDecoder()
            guard let categories = try? jsonDecoder.decode([Category].self, from: data) else {
                print(#line, #function, "Cant decode data from \(data)")
                completion(nil)
                return
            }
            completion(categories)
            }.resume()
    }
    
    func loadWords(for category: Category, completion: @escaping ([CategoryWord]?) -> Void) {
        let url = baseurl.appendingPathComponent("words").appendingPathComponent("\(category.id)")
        
        URLSession.shared.dataTask(with: url) { data,response,error in
            guard let data = data else {
                print(#line, #function, "Cant get data from \(url.absoluteString)")
                completion(nil)
                return
            }
            let jsonDecoder = JSONDecoder()
            guard let words = try? jsonDecoder.decode([CategoryWord].self, from: data) else {
                print(#line, #function, "Cant decode data from \(data)")
                completion(nil)
                return
            }
            completion(words)
            }.resume()
    }
}
