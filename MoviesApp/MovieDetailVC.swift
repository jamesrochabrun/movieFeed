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
    
    var movie: Movie? {
        didSet {
            if let movie = movie {
                self.movieDataSource = MovieDataSource(movie: movie)
                
                let miv = MovieImageView()
                miv.contentMode = .scaleAspectFill
                miv.translatesAutoresizingMaskIntoConstraints = false
                miv.clipsToBounds = true
                miv.loadImageUsingCacheWithURLString(movie.imageURL, placeHolder: nil)
                self.tableView.backgroundView = miv
                let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
                let blurEffectView = UIVisualEffectView(effect: blurEffect)
                blurEffectView.frame = miv.bounds
                blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                self.tableView.backgroundView?.addSubview(blurEffectView)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(MainDetailCell.self, forCellReuseIdentifier: mainCellID)
        tableView.register(SummaryCell.self, forCellReuseIdentifier: summaryCellID)
        tableView.register(PriceCell.self, forCellReuseIdentifier: subDetailCellID)
        tableView.dataSource = movieDataSource
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.contentInset = UIEdgeInsetsMake(22, 0, 0, 0)
        NotificationCenter.default.addObserver(self, selector: #selector(dismissView), name: NSNotification.Name.dismissViewNotification, object: nil)
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


















