//
//  ItunesAPIClient.swift
//  MoviesApp
//
//  Created by James Rochabrun on 3/19/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

struct MovieService: Gettable {
    
    //1 properties
    let endpoint: String = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"

    let downloader = JSONDownloader()
    
    //the associated type is inferred by <[Movie?]>
    typealias MoviesCompletionHandler = (Result<[Movie?]>) -> ()
    
    //3 protocol required function
    func get(completion: @escaping MoviesCompletionHandler) {
        
        guard let url = URL(string: self.endpoint) else {
            completion(.Error(.invalidURL))
            return
        }
        let request = URLRequest(url: url)
        let task = downloader.jsonTask(with: request) { (result) in
            
            DispatchQueue.main.async {
                switch result {
                case .Error(let error):
                    completion(.Error(error))
                    return
                case .Success(let json):
                    //4 parsing the Json response
                    guard let movieJSONFeed = json["feed"] as? [String: AnyObject], let entryArray = movieJSONFeed["entry"] as? [[String: AnyObject]] else {
                        completion(.Error(.jsonParsingFailure))
                        return
                    }
                    //5 maping the array and create Movie objects
                    let movieArray = entryArray.map{Movie(json: $0)}
                    completion(.Success(movieArray))
                }
            }
        }
        task.resume()
    }
}

//2 uisng associatedType in protocol
protocol Gettable {
    associatedtype T
    func get(completion: @escaping (Result<T>) -> Void)
}








