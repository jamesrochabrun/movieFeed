//
//  ItunesAPIClient.swift
//  MoviesApp
//
//  Created by James Rochabrun on 3/19/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit


class ItunesAPIClient {
    
    let endpoint: String = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"

    let downloader = JSONDownloader()
    typealias CurrentWeatherCompletionHandler = (Result<[Movie?]>) -> ()
    
    func getMovieFeedWith(completion: @escaping CurrentWeatherCompletionHandler) {
        
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
                    guard let movieJSONFeed = json["feed"] as? [String: AnyObject], let entryArray = movieJSONFeed["entry"] as? [[String: AnyObject]] else {
                        completion(.Error(.jsonParsingFailure))
                        return
                    }
                    let movieArray = entryArray.map{Movie(json: $0)}
                    completion(.Success(movieArray))
                }
            }
        }
        task.resume()
    }
}







