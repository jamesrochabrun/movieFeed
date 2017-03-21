//
//  MovieCell.swift
//  MoviesApp
//
//  Created by James Rochabrun on 3/20/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit


class MovieCell: BaseCell {
    
    let movieImageView: MovieImageView = {
        let miv = MovieImageView(frame: CGRect.zero)
        miv.translatesAutoresizingMaskIntoConstraints = false
        return miv
    }()
    
    let containerView: UIView = {
        let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    let overlayView: UIView = {
        let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor.hexStringToUIColor(Constants.Colors.backGroundColor)
        cv.alpha = 0.4
        return cv
    }()
    
    let movieTitleLabel: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.subheadline)
        l.textAlignment = .center
        l.textColor = .white
        return l
    }()
    
    let releaseDateLabel: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.caption1)
        l.textAlignment = .center
        l.textColor = .white
        return l
    }()
    
    let priceLabel: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        l.textAlignment = .center
        l.textColor = .white
        return l
    }()
    
    override func setupViews() {
        
        addSubview(movieImageView)
        movieImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        movieImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        movieImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        movieImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(containerView)
        containerView.addSubview(overlayView)
        containerView.addSubview(movieTitleLabel)
        containerView.addSubview(releaseDateLabel)
        containerView.addSubview(priceLabel)
        
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: Constants.UI.containerCellHeight).isActive = true
        
        overlayView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        overlayView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        overlayView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        overlayView.heightAnchor.constraint(equalToConstant: Constants.UI.containerCellHeight).isActive = true
        
        movieTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.UI.cellPadding).isActive = true
        movieTitleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -Constants.UI.cellPadding).isActive = true
        movieTitleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: Constants.UI.cellPadding).isActive = true
        movieTitleLabel.heightAnchor.constraint(equalToConstant: ((Constants.UI.containerCellHeight - Constants.UI.cellPadding * 2) / 3)).isActive = true
        
        releaseDateLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor).isActive = true
        releaseDateLabel.leftAnchor.constraint(equalTo: movieTitleLabel.leftAnchor).isActive = true
        releaseDateLabel.rightAnchor.constraint(equalTo: movieTitleLabel.rightAnchor).isActive = true
        releaseDateLabel.heightAnchor.constraint(equalTo: movieTitleLabel.heightAnchor).isActive = true
        
        priceLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: movieTitleLabel.leftAnchor).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: movieTitleLabel.rightAnchor).isActive = true
        priceLabel.heightAnchor.constraint(equalTo: movieTitleLabel.heightAnchor).isActive = true
    }
    
    func displayMovieInCell(using viewModel: MovieViewModel) {
        
        movieImageView.loadImageUsingCacheWithURLString(viewModel.imageURL, placeHolder: UIImage())
        movieTitleLabel.text = viewModel.title
        releaseDateLabel.text = viewModel.releaseDate
        priceLabel.text = viewModel.purchasePrice
    }
}




