//
//  MovieViewModel.swift
//  MoviesApp
//
//  Created by James Rochabrun on 3/19/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

struct MovieViewModel {
    
    let title: String
    let imageURL: String
    let releaseDate: String
    let purchasePrice: String
    let itunesURL: String
    
    let rentalPrice: String
    let summary: String
    let category: String
    
    init(model: Movie) {
        self.title = model.title.uppercased()
        self.imageURL = model.imageURL
        self.releaseDate = model.releaseDate
        self.purchasePrice = String(format: "%.2f %@", model.purchasePrice.amount, model.purchasePrice.currency)
        self.itunesURL = model.itunesURL
        self.rentalPrice = String(format: "%.2f %@", model.rentalPrice.amount, model.rentalPrice.currency)
        self.summary = model.summary
        self.category = model.category
    }
}
