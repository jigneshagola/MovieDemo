//
//  MovieListViewController.swift
//  MovieDemo
//
//  Created by craftsvilla on 10/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import UIKit
import Kingfisher
class MovieListViewController: UIViewController,IMovieListView,UISearchControllerDelegate, UISearchResultsUpdating {

    var presenter: IMovieListPresenter!
    var movies: [Movie] = []
    
    var searchController:UISearchController!
    var searchResultViewController: MovieSearchResultViewController?
    
    var noSearchResultLabel:UILabel?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        self.setupView()
    }
    
    fileprivate func setupView() {
        
        self.collectionView.register(UINib(nibName: R.CellId.movieList, bundle: nil), forCellWithReuseIdentifier: R.CellId.movieList)
        
        let sortButton = UIBarButtonItem(
            title: "Sort",
            style: .plain,
            target: self,
            action: #selector(MovieListViewController.didClickSortButton(sender:))
        )
        navigationItem.rightBarButtonItem = sortButton
        
        let flowLayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        self.searchResultViewController = MovieSearchResultViewController(collectionViewLayout: flowLayout)
        self.searchResultViewController?.presenter = presenter
        
        self.searchController = UISearchController(searchResultsController:  self.searchResultViewController)
        
        
        self.searchController.searchResultsUpdater = self
        self.searchController.delegate = self
        
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = false
        
        self.navigationItem.titleView = searchController.searchBar
        
        self.definesPresentationContext = true
    }
    
//MARK: Interface mathods
    
    func showMoviesData(movies: [Movie]) {
        self.movies = movies
        collectionView.reloadData()
    }
    
    func didClickSortButton(sender: Any) {
        self.presenter.didClickSortButton()
    }
    
    func displaySearchResult(for movies:[Movie]) {
        if let label = self.noSearchResultLabel {
            label.removeFromSuperview()
        }
        self.searchResultViewController?.movies = movies
        self.searchResultViewController?.collectionView?.reloadData()
    }
    
    func displayNoSearchResult() {
        
        self.searchResultViewController?.movies.removeAll()
        self.searchResultViewController?.collectionView?.reloadData()
        
        guard let  _ = self.noSearchResultLabel  else {
            self.noSearchResultLabel = UILabel()
            
            self.noSearchResultLabel!.text = "\"Sorry, No Results Found\""
            self.noSearchResultLabel!.sizeToFit()
            self.noSearchResultLabel!.center = CGPoint(x: (self.searchResultViewController?.collectionView?.center.x)!, y: 15)
            
            self.searchResultViewController?.collectionView?.addSubview(self.noSearchResultLabel!)
            
            return
        }
    }
    
//MARK: Search Delegate
    func updateSearchResults(for searchController: UISearchController) {
        self.presenter.searchMovie(for: searchController.searchBar.text!)
    }
}

extension MovieListViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.CellId.movieList, for: indexPath) as! MovieCollectionViewCell
        
        let movie = self.movies[indexPath.row]
        cell.setUpCell(movie: movie)
        
        if indexPath.row == self.movies.count - 2 {
            self.presenter.fetchMoreMovies()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = self.movies[indexPath.row]
        self.presenter.didSelectMovie(movie: movie)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/2 - 12, height: 270)
    }
}


