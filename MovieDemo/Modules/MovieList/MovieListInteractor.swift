//
//  MovieListInteractor.swift
//  MovieDemo
//
//  Created by craftsvilla on 11/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import UIKit

class MovieListInteractor: IMovieListInteractor {
    var presenter: IMovieListPresenter!
    
    func fetchMovie(for page: Int, sortType: SortType) {
        MovieListService.fetchMovie(for: page, sortBy: sortType.rawValue) { (movies) in
            self.movieFetched(movie: movies)
        }
    }
    
    func movieFetched(movie: [Movie]) {
        self.presenter.moviesFetched(movies: movie)
    }
    
    func movieFetchFailed() {
        
    }
}
