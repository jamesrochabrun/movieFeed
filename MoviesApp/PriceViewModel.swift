//
//  PriceViewModel.swift
//  MoviesApp
//
//  Created by James Rochabrun on 3/20/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation


struct PriceViewModel {

    let purchasePrice: String
    let rentalPrice: String

    init(model: Movie) {
  
        if let doublePurchasePrice = Double(model.purchasePrice.amount) {
            self.purchasePrice = String(format: "BUY %.02f %@", doublePurchasePrice, model.purchasePrice.currency)
        } else {
            self.purchasePrice = ""
        }
        if let doubleRentalPrice = Double(model.rentalPrice.amount) {
            self.rentalPrice = String(format: "RENT %.02f %@", doubleRentalPrice, model.rentalPrice.currency)
        } else {
            self.rentalPrice = ""
        }
    }
}
