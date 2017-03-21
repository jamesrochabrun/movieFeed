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
    let releaseDate: String
    let purchasePrice: String
    let itunesURL: String
    let imageURL: String
    
    let rentalPrice: String
    let summary: String
    let category: String
    
    init(model: Movie) {
        self.title = model.title.uppercased()
        self.imageURL = model.imageURL
        self.releaseDate = model.releaseDate
        if let doublePurchasePrice = Double(model.purchasePrice.amount) {
            self.purchasePrice = String(format: "%.02f %@", doublePurchasePrice, model.purchasePrice.currency)
        } else {
            self.purchasePrice = "Not available for Purchase"
        }
        if let doubleRentalPrice = Double(model.rentalPrice.amount) {
            self.rentalPrice = String(format: "%.02f %@", doubleRentalPrice, model.rentalPrice.currency)
        } else {
            self.rentalPrice = "Not available for Rent"
        }
        self.itunesURL = model.itunesURL
        self.summary = model.summary == "" ? "No data provided" : model.summary
        self.category = model.category == "" ? "No data provided" : model.category
    }
}
