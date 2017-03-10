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
    
    func fetchMovie(for page: Int) {
        MovieListService.fetchMovie(for: page, sortBy: "") { (movies) in
            self.movieFetched(movie: movies)
        }
    }
    
    func movieFetched(movie: [Movie]) {
        
    }
    
    func movieFetchFailed() {
        
    }
}
