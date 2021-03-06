//
//  MainDetailCell.swift
//  MoviesApp
//
//  Created by James Rochabrun on 3/20/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit


class MainDetailCell: BaseTableViewCell {
    
    let movieImageView: MovieImageView = {
        let miv = MovieImageView(frame: CGRect.zero)
        miv.translatesAutoresizingMaskIntoConstraints = false
        return miv
    }()
    
    let containerView: UIView = {
        let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.opaque(with: Constants.Colors.backGroundColor, alpha: 0.4)
        return cv
    }()

    let categoryLabel: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.subheadline)
        l.textAlignment = .center
        l.textColor = .white
        return l
    }()
    
    let movieTitleLabel: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
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
    
    let dismissButton: CustomDismissButton = {
        let dbv = CustomDismissButton()
        return dbv
    }()
    
    override func setupViews() {
        
        addSubview(movieImageView)
        movieImageView.backgroundColor = .orange
        movieImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        movieImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        movieImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        movieImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.45).isActive = true
        
        addSubview(containerView)
        containerView.leftAnchor.constraint(equalTo: movieImageView.rightAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        containerView.addSubview(categoryLabel)
        containerView.addSubview(releaseDateLabel)
        containerView.addSubview(movieTitleLabel)
        
        categoryLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: Constants.UI.mainDetailCellPaddingHorizontal).isActive = true
        categoryLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -Constants.UI.mainDetailCellPaddingHorizontal).isActive = true
        categoryLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: (Constants.UI.mainDetailCellHeight / 2) + Constants.UI.cellPadding).isActive = true
        
        movieTitleLabel.bottomAnchor.constraint(equalTo: categoryLabel.topAnchor, constant: -Constants.UI.mainDetailCellPaddingVertical).isActive = true
        movieTitleLabel.leftAnchor.constraint(equalTo: categoryLabel.leftAnchor).isActive = true
        movieTitleLabel.rightAnchor.constraint(equalTo: categoryLabel.rightAnchor).isActive = true
        
        releaseDateLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: Constants.UI.mainDetailCellPaddingVertical).isActive = true
        releaseDateLabel.leftAnchor.constraint(equalTo: categoryLabel.leftAnchor).isActive = true
        releaseDateLabel.rightAnchor.constraint(equalTo: categoryLabel.rightAnchor).isActive = true
        
        addSubview(dismissButton)
        dismissButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        dismissButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        dismissButton.heightAnchor.constraint(equalToConstant: Constants.UI.dismissButtonHeight).isActive = true
        dismissButton.widthAnchor.constraint(equalToConstant: Constants.UI.dismissButtonWidth).isActive = true
    }
    
    func displayMovieInCell(using viewModel: MovieViewModel) {
        
        movieImageView.loadImageUsingCacheWithURLString(viewModel.imageURL, placeHolder: #imageLiteral(resourceName: "placeholder"))
        movieTitleLabel.text = viewModel.title
        releaseDateLabel.text = viewModel.releaseDate
        categoryLabel.text = viewModel.category
    }
}





