//
//  PriceCell.swift
//  MoviesApp
//
//  Created by James Rochabrun on 3/20/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class PriceCell: BaseTableViewCell {
    
    let purchaseLabel: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.subheadline)
        l.textAlignment = .center
        l.textColor = .white
        l.layer.borderColor = UIColor.hexStringToUIColor(Constants.Colors.purpleColor).cgColor
        l.backgroundColor = UIColor.hexStringToUIColor(Constants.Colors.purpleColor)
        l.layer.masksToBounds = true
        l.layer.borderWidth = 1.0
        l.layer.cornerRadius = 20
        return l
    }()
    
    let rentLabel: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.subheadline)
        l.textAlignment = .center
        l.textColor = .white
        l.backgroundColor = UIColor.hexStringToUIColor(Constants.Colors.purpleColor)
        l.layer.borderColor = UIColor.hexStringToUIColor(Constants.Colors.purpleColor).cgColor
        l.layer.masksToBounds = true
        l.layer.borderWidth = 1.0
        l.layer.cornerRadius = 20
        return l
    }()
    
    override func setupViews() {
        
        addSubview(purchaseLabel)
        addSubview(rentLabel)
        
        purchaseLabel.heightAnchor.constraint(equalToConstant: Constants.UI.heightPriceButton).isActive = true
        purchaseLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
        purchaseLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        purchaseLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.UI.priceCellPaddingVertical).isActive = true
        
        rentLabel.topAnchor.constraint(equalTo: purchaseLabel.bottomAnchor, constant: Constants.UI.mainDetailCellPaddingHorizontal).isActive = true
        rentLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
        rentLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        rentLabel.heightAnchor.constraint(equalToConstant: Constants.UI.heightPriceButton).isActive = true
    }
    
    func displayMovieInCell(using viewModel: PriceViewModel) {
        purchaseLabel.text = viewModel.purchasePrice
        rentLabel.text = viewModel.rentalPrice
        
    }
}
