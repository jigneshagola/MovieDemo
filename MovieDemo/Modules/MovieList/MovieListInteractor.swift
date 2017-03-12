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
        MovieListService.fetchMovie(for: page, sortBy: sortType.rawValue) { (movies, error) in
            if let err = error {
                self.movieFetchFailed(with: err)
            } else {
                self.movieFetched(movies: movies!)
            }
        }
    }
    
    func movieFetched(movies: [Movie]) {
        self.presenter.moviesFetched(movies: movies)
    }
    
    func movieFetchFailed(with error: Error) {
        self.presenter.moviesFethingFailed(error: error)
    }
}
