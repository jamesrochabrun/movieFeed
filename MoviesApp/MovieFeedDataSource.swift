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
    private var movies = [Movie]() {
        didSet {
            NotificationCenter.default.post(name: Notification.Name.successDataNotification, object: nil)
        }
    }
    
    override init() {
        super.init()
        getMovies(fromService: MovieService())
    }
    
    //this function accepts a service that conform to the Gettable protocol and that that protocol's associated type is type Array<Movie?>
    private func getMovies<S: Gettable>(fromService service: S) where S.T == Array<Movie?> {
        service.get { [weak self] (result) in
            switch result {
            case .Success(let movies):
                var tempMovies = [Movie]()
                for movie in movies {
                    if let movie = movie {
                        tempMovies.append(movie)
                    }
                }
                self?.movies = tempMovies
            //dump(self.movies)
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
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as MovieCell
        let movie = movies[indexPath.item]
        let movieViewModel = MovieViewModel(model: movie)
        cell.displayMovieInCell(using: movieViewModel)
        return cell
    }
}



