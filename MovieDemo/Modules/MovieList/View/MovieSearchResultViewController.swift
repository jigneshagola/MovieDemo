//
//  MovieSearchResultViewController.swift
//  MovieDemo
//
//  Created by craftsvilla on 12/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import UIKit

class MovieSearchResultViewController: UICollectionViewController {
    
    var movies:[Movie] = []
    var presenter: IMovieListPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.register(UINib(nibName: R.CellId.movieList, bundle: nil), forCellWithReuseIdentifier: R.CellId.movieList)
        self.collectionView?.backgroundColor = UIColor.white
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
    }
}

extension MovieSearchResultViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.CellId.movieList, for: indexPath) as! MovieCollectionViewCell
        
        let movie = self.movies[indexPath.row]
        cell.setUpCell(movie: movie)
        
        return cell;
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let movie = self.movies[indexPath.row]
        self.presenter.didSelectMovie(movie: movie)
    }
}

