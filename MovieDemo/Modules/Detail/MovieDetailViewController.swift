//
//  MovieDetailViewController.swift
//  MovieDemo
//
//  Created by craftsvilla on 11/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import UIKit

enum Row:Int {
    case header = 0
    case overView = 1
    case detail = 2
}
class MovieDetailViewController: UIViewController,IMovieDetailView {
    
    var presenter: IMovieDetailPresenter!
    var movie:Movie?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        presenter.viewDidLoad()
    }
    
    func setUpView() {
        
        self.tableView.register(UINib(nibName: R.CellId.movieDetailHeader, bundle:nil), forCellReuseIdentifier: R.CellId.movieDetailHeader)
        self.tableView.register(UINib(nibName: R.CellId.movieDetail, bundle:nil), forCellReuseIdentifier: R.CellId.movieDetail)
    }
    
    func showDetails(for movie: Movie) {
        self.movie = movie
        self.tableView.delegate = self;
        self.tableView.dataSource = self
    }
}

extension MovieDetailViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case Row.header.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: R.CellId.movieDetailHeader) as! MovieHeaderTableViewCell
            
            cell.setHeaderView(movie: self.movie!)
            
            return cell;
        case Row.overView.rawValue:
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell");
            
            cell.textLabel?.text = self.movie?.overview
            cell.textLabel?.numberOfLines = 0;
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
            
            return cell
        case Row.detail.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: R.CellId.movieDetail) as! MovieDetailTableViewCell
            
            cell.setUpMovie(movie: self.movie!)
            
            return cell;
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case Row.header.rawValue:
            return 200
        case Row.overView.rawValue:
            let height = self.movie?.overview?.heightWithConstrainedWidth(self.tableView.frame.size.width - 30, font: UIFont.systemFont(ofSize: 14))
            return height! + 30
        case Row.detail.rawValue:
            return 165
        default:
            return 60
        }
    }
    
}
