//
//  Movie.swift
//  MoviesApp
//
//  Created by James Rochabrun on 3/19/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation

struct Movie {
    
    let title: String
    let imageURL: String
    let releaseDate: String
    let purchasePrice: Price
    let itunesURL: String
    
    let rentalPrice: Price
    let summary: String
    let category: String
}

struct Price {
    let amount: String
    let currency: String
}

extension Movie {
    
    struct Key  {
        static let titleDict = "im:name"
        static let imageURLArray = "im:image"
        static let releaseDateDict = "im:releaseDate"
        static let categoryDict = "category"
        static let rentalPriceDict = "im:rentalPrice"
        static let purchacePriceDict = "im:price"
        static let itunesLinkArray = "link"
        static let summaryDict = "summary"
        static let label = "label"
        static let attributes = "attributes"
        static let amount = "amount"
        static let currency = "currency"
        static let href = "href"
        static let term = "term"
    }
    
    init?(json: [String: AnyObject]) {
        
        guard let titleDict = json[Key.titleDict] as? [String: AnyObject],
            let title = titleDict[Key.label] as? String,
            let imageURLArray = json[Key.imageURLArray] as? [[String: AnyObject]],
            let imageURL = imageURLArray.last?[Key.label] as? String,
            let releaseDateDict = json[Key.releaseDateDict] as? [String: AnyObject],
            let releaseDateAttributes = releaseDateDict[Key.attributes],
            let releaseDate = releaseDateAttributes[Key.label] as? String,
            let purchasePriceDict = json[Key.purchacePriceDict] as? [String: AnyObject],
            let purchasePriceAttributes = purchasePriceDict[Key.attributes] as? [String: AnyObject],
            let priceAmount = purchasePriceAttributes[Key.amount] as? String,
            let priceCurrency = purchasePriceAttributes[Key.currency] as? String,
            let itunesLinkArray = json[Key.itunesLinkArray] as? [[String: AnyObject]],
            let itunesDict = itunesLinkArray.first,
            let attributesItunesDict = itunesDict[Key.attributes] as? [String: AnyObject],
            let itunesURL = attributesItunesDict[Key.href] as? String
        else {
            return nil
        }
        
        self.title = title
        self.imageURL = imageURL
        self.releaseDate = releaseDate
        self.purchasePrice = Price(amount: priceAmount, currency: priceCurrency)
        self.itunesURL = itunesURL
        
        if let rentalPriceDict = json[Key.rentalPriceDict] as? [String: AnyObject], let attributesDict = rentalPriceDict[Key.attributes] as? [String: AnyObject], let amount = attributesDict[Key.amount] as? String, let currency = attributesDict[Key.currency] as? String {
            self.rentalPrice = Price(amount: amount, currency: currency)
        } else {
            self.rentalPrice = Price(amount: "", currency: "")
        }
        if let summaryDict = json[Key.summaryDict] as? [String: AnyObject], let summary = summaryDict[Key.label] as? String {
            self.summary = summary
        } else {
            self.summary = ""
        }
        if let categoryDict = json[Key.categoryDict] as? [String: AnyObject], let attributesDict = categoryDict[Key.attributes] as? [String: AnyObject], let category = attributesDict[Key.term] as? String {
            self.category = category
        } else {
            self.category = ""
        }
    }
}



