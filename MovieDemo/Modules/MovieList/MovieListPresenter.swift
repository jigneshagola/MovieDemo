//
//  MovieListPresenter.swift
//  MovieDemo
//
//  Created by craftsvilla on 10/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import UIKit

enum SortType:String {
    case popularity = "popularity.desc"
    case highestRated = "vote_average.desc"
}

class MovieListPresenter: IMovieListPresenter {
    
    var interactor: IMovieListInteractor!
    var router: IMovieListRouter!
    var view: IMovieListView?
    
    var movies: [Movie] = [Movie]()
    var currentPage = 0
    
    var isMoreDataAvailable:Bool = true;
    var sortType:SortType = .popularity
    
    func viewDidLoad() {
        self.fetchMoreMovies()
    }
    
    func moviesFetched(movies:[Movie]) {
        
        if movies.count < 10 {
            self.isMoreDataAvailable = false
        }
        
        self.movies = self.movies + movies
        self.view?.showMoviesData(movies: self.movies)
    }
    
    func fetchMoreMovies() {
        if isMoreDataAvailable == true {
            currentPage = currentPage + 1
            self.interactor.fetchMovie(for: self.currentPage, sortType: self.sortType)
        }
    }
    
    func didClickSortButton() {
        router.presentSortOptions { (sortType) in
            if self.sortType != sortType {
                self.sortType = sortType
                self.currentPage = 0
                self.isMoreDataAvailable = true
                self.movies.removeAll()
                self.fetchMoreMovies()
            }
        }
    }
    
    func didSelectMovie(movie: Movie) {
        
    }
}
