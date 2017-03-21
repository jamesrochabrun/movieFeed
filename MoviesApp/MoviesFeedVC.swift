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
    lazy var gradientView: GradientView = {
        let gv = GradientView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 22))
        return gv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.hexStringToUIColor(Constants.Colors.backGroundColor)
        collectionView?.register(MovieCell.self, forCellWithReuseIdentifier: cellID)
        collectionView?.dataSource = movieDataSource
        collectionView?.contentInset = UIEdgeInsetsMake(22, 0, 0, 0)
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTable), name: NSNotification.Name.successDataNotification, object: nil)
        setUpViews()
    }
    
    private func setUpViews() {
        view.addSubview(gradientView)
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

extension MoviesFeedVC: UICollectionViewDelegateFlowLayout {
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        gradientView.updateGradientSizeWith(size)
        collectionView?.collectionViewLayout.invalidateLayout()
    }
}

extension MoviesFeedVC {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let movie = movieDataSource.getMovies()[indexPath.item]
        let movieDetailVC = MovieDetailVC()
        movieDetailVC.movie = movie
        self.present(movieDetailVC, animated: true)
    }
}

















