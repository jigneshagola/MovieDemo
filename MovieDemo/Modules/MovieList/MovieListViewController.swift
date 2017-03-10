//
//  MovieListViewController.swift
//  MovieDemo
//
//  Created by craftsvilla on 10/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import UIKit
import Kingfisher
class MovieListViewController: UIViewController,IMovieListView {
    
    var presenter: IMovieListPresenter!
    var movies: [Movie] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        self.setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setupView() {
        self.collectionView.register(UINib(nibName: R.CellId.movieList, bundle: nil), forCellWithReuseIdentifier: R.CellId.movieList)
        
        let sortButton = UIBarButtonItem(
            title: "Sort",
            style: .plain,
            target: self,
            action: #selector(MovieListViewController.didClickSortButton(sender:))
        )
        navigationItem.rightBarButtonItem = sortButton
    }
    
    func showNoContentScreen() {
        
    }

    func showMoviesData(movies: [Movie]) {
        self.movies = movies
    }
    
    func didClickSortButton(sender: Any) {
        self.presenter.didClickSortButton()
    }
}

extension MovieListViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
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
        
        return cell;
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = self.movies[indexPath.row]
        self.performSegue(withIdentifier: "detailSegue", sender: movie)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/2 - 12, height: 270)
    }
}
