//
//  MovieDataSource.swift
//  MoviesApp
//
//  Created by James Rochabrun on 3/20/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class MovieDataSource: NSObject, UITableViewDataSource {
    
    private var movie: Movie?
    private let mainCellID = "mainCellID"
    private let summaryCellID = "summaryCellID"
    private let subDetailCellID = "subDetailCellID"
    private let numberOfFields: Int = 3
    
    override init() {
        super.init()
    }
    
    convenience init(movie: Movie) {
        self.init()
        self.movie = movie
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let movie = self.movie else {
            return BaseTableViewCell()
        }
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: mainCellID, for: indexPath) as! MainDetailCell
                let movieViewModel = MovieViewModel(model: movie)
                cell.displayMovieInCell(using: movieViewModel)
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: summaryCellID, for: indexPath) as! SummaryCell
                let movieViewModel = MovieViewModel(model: movie)
                cell.displayMovieInCell(using: movieViewModel)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: subDetailCellID, for: indexPath) as! PriceCell
            let priceViewModel = PriceViewModel(model: movie)
            cell.displayMovieInCell(using: priceViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfFields
    }
}




