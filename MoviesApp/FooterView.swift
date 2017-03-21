//
//  FooterView.swift
//  MoviesApp
//
//  Created by James Rochabrun on 3/20/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

protocol FooterViewDelegate: class {
    func showAlertControllerInVC()
}

class FooterView: BaseView {
    
    weak var delegate: FooterViewDelegate?
    lazy var itunesButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = UIColor.hexStringToUIColor(Constants.Colors.goldColor)
        b.setTitle("View On Itunes", for: .normal)
        b.addTarget(self, action: #selector(handleTrigger), for: .touchUpInside)
        return b
    }()
    
    override func setUpViews() {
        translatesAutoresizingMaskIntoConstraints = true
        addSubview(itunesButton)
        itunesButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        itunesButton.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        itunesButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        itunesButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    @objc private func handleTrigger() {
        delegate?.showAlertControllerInVC()
    }
    
}
