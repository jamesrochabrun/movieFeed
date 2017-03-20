//
//  ViewController.swift
//  MoviesApp
//
//  Created by James Rochabrun on 3/19/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class MoviesFeedVC: UICollectionViewController {
    
    private let cellID = "cellID"
    fileprivate let movieDataSource = MovieFeedDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(MovieCell.self, forCellWithReuseIdentifier: cellID)
        collectionView?.dataSource = movieDataSource
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTable), name: NSNotification.Name.successDataNotification, object: nil)
    }
    
    func reloadTable() {
        collectionView?.reloadData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension MoviesFeedVC {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let movie = movieDataSource.getMovies()[indexPath.item]
        let movieDetailVC = MovieDetailVC(collectionViewLayout: UICollectionViewFlowLayout())
        movieDetailVC.movie = movie
        let navVC = UINavigationController(rootViewController: movieDetailVC)
        self.present(navVC, animated: true)
    }
}

















