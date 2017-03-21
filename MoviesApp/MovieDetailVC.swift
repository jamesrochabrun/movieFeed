//
//  File.swift
//  MoviesApp
//
//  Created by James Rochabrun on 3/20/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailVC: UITableViewController {
    
    private let mainCellID = "mainCellID"
    private let summaryCellID = "summaryCellID"
    private let subDetailCellID = "subDetailCellID"
    private var movieDataSource: MovieDataSource?
    
    let movieImageview: MovieImageView = {
        let miv = MovieImageView()
        miv.contentMode = .scaleAspectFill
        miv.translatesAutoresizingMaskIntoConstraints = false
        miv.clipsToBounds = true
        
        miv.backgroundColor = .red
        return miv
    }()
    
    var movie: Movie? {
        didSet {
            if let movie = movie {
                self.movieDataSource = MovieDataSource(movie: movie)
                //self.movieImageview.loadImageUsingCacheWithURLString(movie.imageURL, placeHolder: nil)
//                
//                self.tableView.backgroundView = miv
//                let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
//                let blurEffectView = UIVisualEffectView(effect: blurEffect)
//                blurEffectView.frame = miv.bounds
//                blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//                self.tableView.backgroundView?.addSubview(blurEffectView)
//                
//                let gv = GradientView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 22))
//                self.tableView.backgroundView?.addSubview(gv)
                
                
                
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.backgroundColor = .clear
        tableView.register(MainDetailCell.self, forCellReuseIdentifier: mainCellID)
        tableView.register(SummaryCell.self, forCellReuseIdentifier: summaryCellID)
        tableView.register(PriceCell.self, forCellReuseIdentifier: subDetailCellID)
        tableView.dataSource = movieDataSource
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.contentInset = UIEdgeInsetsMake(22, 0, 0, 0)
        NotificationCenter.default.addObserver(self, selector: #selector(dismissView), name: NSNotification.Name.dismissViewNotification, object: nil)
        setUpViews()
    }
    
    func setUpViews() {
        
        self.tableView.addSubview(movieImageview)
        movieImageview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        movieImageview.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        movieImageview.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        movieImageview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return Constants.UI.mainDetailCellHeight
        } else if indexPath.row == 1 {
            return self.tableView.rowHeight
        }
        return (Constants.UI.heightPriceButton * 2) + (Constants.UI.mainDetailCellPaddingHorizontal * 3)
    }
    
    @objc private func dismissView() {
        self.dismiss(animated: true)
    }
}


















