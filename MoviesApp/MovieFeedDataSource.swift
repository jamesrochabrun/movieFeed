//
//  MovieFeedDataSource.swift
//  MoviesApp
//
//  Created by James Rochabrun on 3/20/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class MovieFeedDataSource: NSObject, UICollectionViewDataSource {
    
    private let cellID = "cellID"
    private var movies = [Movie]()
    private let client = ItunesAPIClient()

    
    override init() {
        super.init()
        
        client.getMovieFeedWith { (result) in
            switch result {
            case .Success(let movies):
                for movie in movies {
                    if let movie = movie {
                        self.movies.append(movie)
                    }
                }
                //dump(movies)
                NotificationCenter.default.post(name: Notification.Name.successDataNotification, object: nil)
            case .Error(let error):
                print(error)
            }
        }
    }
    
    func getMovies() -> [Movie] {
        return movies
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MovieCell
        let movie = movies[indexPath.item]
        let movieViewModel = MovieViewModel(model: movie)
        cell.displayMovieInCell(using: movieViewModel)
        return cell
    }



}
