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
    
    let movieIMageView: MovieImageView = {
        let miv = MovieImageView(frame: CGRect.zero)
        miv.blurWith(style: .light)
        miv.opaqueWith(color: Constants.Colors.backGroundColor, alpha: 0.3)
        return miv
    }()
    
    var movie: Movie? {
        didSet {
            if let movie = movie {
                //this shows the data in the cells
                self.movieDataSource = MovieDataSource(movie: movie)
                /////////////////
                self.movieIMageView.loadImageUsingCacheWithURLString(movie.imageURL, placeHolder: #imageLiteral(resourceName: "placeholder"))
                self.tableView.backgroundView = self.movieIMageView
            }
        }
    }
    
    lazy var gradientView: GradientView = {
        let gv = GradientView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 22))
        return gv
    }()
    
    lazy var footerView: FooterView = {
        let f = FooterView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        f.delegate = self
        return f
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = movieDataSource
        tableView?.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.backgroundColor = UIColor.hexStringToUIColor(Constants.Colors.backGroundColor)
        tableView.register(MainDetailCell.self, forCellReuseIdentifier: mainCellID)
        tableView.register(SummaryCell.self, forCellReuseIdentifier: summaryCellID)
        tableView.register(PriceCell.self, forCellReuseIdentifier: subDetailCellID)
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
        return (Constants.UI.heightPriceButton * 2) + (Constants.UI.priceCellPaddingVertical * 2) + Constants.UI.mainDetailCellPaddingHorizontal
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return gradientView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.UI.statusBarHeight
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footerView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return Constants.UI.footerbuttonHeight
    }

    @objc private func dismissView() {
        self.dismiss(animated: true)
    }
}

extension MovieDetailVC: FooterViewDelegate {
    
    func showAlertControllerInVC() {
        
        let alertController = UIAlertController(title: "View on Itunes", message: "You are about to leave MoviesApp", preferredStyle: .alert)
        
        let goAction = UIAlertAction(title: "Go", style: .default) { (action) in
            if let movie = self.movie, let url = URL(string: movie.itunesURL) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(goAction)
        alertController.addAction(cancelAction)
        
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

















