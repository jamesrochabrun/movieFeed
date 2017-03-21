//
//  SummaryCell.swift
//  MoviesApp
//
//  Created by James Rochabrun on 3/20/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class SummaryCell: BaseTableViewCell {
    
    let summaryText: UITextView = {
        let tv =  UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.isUserInteractionEnabled = false
        tv.isScrollEnabled = false
        tv.backgroundColor = .clear
        tv.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.subheadline)
        tv.textColor = .white
        return tv
    }()
    
    override func setupViews() {
        
        contentView.addSubview(summaryText)
        let marginGuide = contentView.layoutMarginsGuide
        summaryText.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        summaryText.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        summaryText.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        summaryText.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        
    }
    
    func displayMovieInCell(using viewModel: MovieViewModel) {
        summaryText.text = viewModel.summary
    }
}
