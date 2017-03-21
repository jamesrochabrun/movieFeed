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
        let miv = MovieImageView()
        miv.contentMode = .scaleAspectFill
        miv.translatesAutoresizingMaskIntoConstraints = false
        miv.clipsToBounds = true
        return miv
    }()
    
    let containerView: UIView = {
        let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        cv.alpha = 0.7
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
    
    lazy var dismissButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setImage(#imageLiteral(resourceName: "dismiss"), for: .normal)
        b.addTarget(self, action: #selector(performHandler), for: .touchUpInside)
        return b
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
        
        containerView.addSubview(releaseDateLabel)
        containerView.addSubview(movieTitleLabel)
        containerView.addSubview(categoryLabel)
        
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
    
    @objc private func performHandler() {
        NotificationCenter.default.post(name: Notification.Name.dismissViewNotification, object: nil)
    }

    
    func displayMovieInCell(using viewModel: MovieViewModel) {
        
        movieImageView.loadImageUsingCacheWithURLString(viewModel.imageURL, placeHolder: UIImage())
        movieTitleLabel.text = viewModel.title
        releaseDateLabel.text = viewModel.releaseDate
        categoryLabel.text = viewModel.category
    }
}





