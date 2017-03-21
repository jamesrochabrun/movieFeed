//
//  File.swift
//  MoviesApp
//
//  Created by James Rochabrun on 3/20/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailVC: UITableViewController {
    
    private let mainCellID = "mainCellID"
    private let summaryCellID = "summaryCellID"
    private let subDetailCellID = "subDetailCellID"
    private var movieDataSource: MovieDataSource?
    
    var movie: Movie? {
        didSet {
            if let movie = movie {
                self.movieDataSource = MovieDataSource(movie: movie)
                let miv = MovieImageView()
                miv.contentMode = .scaleAspectFill
                miv.clipsToBounds = true
                miv.loadImageUsingCacheWithURLString(movie.imageURL, placeHolder: nil)
                
                let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
                let blurEffectView = UIVisualEffectView(effect: blurEffect)
                blurEffectView.frame = miv.bounds
                blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                miv.addSubview(blurEffectView)
                
                self.tableView.backgroundView = miv
            }
        }
    }
    
    lazy var gradientView: GradientView = {
        let gv = GradientView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 22))
        return gv
    }()
    
    lazy var footer: FooterView = {
        let f = FooterView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        return f
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.backgroundColor = UIColor.hexStringToUIColor(Constants.Colors.backGroundColor)
        tableView.register(MainDetailCell.self, forCellReuseIdentifier: mainCellID)
        tableView.register(SummaryCell.self, forCellReuseIdentifier: summaryCellID)
        tableView.register(PriceCell.self, forCellReuseIdentifier: subDetailCellID)
        tableView.dataSource = movieDataSource
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        NotificationCenter.default.addObserver(self, selector: #selector(dismissView), name: NSNotification.Name.dismissViewNotification, object: nil)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        gradientView.updateGradientSizeWith(CGSize(width: view.frame.width, height: 22))
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return Constants.UI.mainDetailCellHeight
        } else if indexPath.row == 1 {
            return self.tableView.rowHeight
        }
        return (Constants.UI.heightPriceButton * 2) + (Constants.UI.mainDetailCellPaddingHorizontal * 3)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return gradientView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.UI.statusBarHeight
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footer
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return Constants.UI.footerbuttonHeight
    }

    @objc private func dismissView() {
        self.dismiss(animated: true)
    }
}


















