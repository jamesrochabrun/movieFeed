//
//  GradientView.swift
//  MoviesApp
//
//  Created by James Rochabrun on 3/20/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class GradientView: BaseView {
        
    override func setUpViews() {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [UIColor.hexStringToUIColor(Constants.Colors.goldColor).cgColor , UIColor.hexStringToUIColor(Constants.Colors.purpleColor).cgColor]
        layer.insertSublayer(gradient, at: 0)
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
    }
}
