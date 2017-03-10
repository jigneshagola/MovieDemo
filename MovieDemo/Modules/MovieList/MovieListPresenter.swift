//
//  MovieListPresenter.swift
//  MovieDemo
//
//  Created by craftsvilla on 10/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import UIKit

class MovieListPresenter: IMovieListPresenter {
    var interactor: IMovieListInteractor!
    var router: IMovieListRouter!
    var view: IMovieListView?
    var movies: [Movie] = [] {
        didSet {
            if movies.count > 0 {
                view?.showMoviesData(movies: movies)
            } else {
                view?.showNoContentScreen()
            }
        }
    }
    func viewDidLoad() {
        interactor.fetchMovie(for: 1)
    }
    
    func didClickSortButton() {
        
    }
    
    func didSelectArticle(movie: Movie) {
        
    }
}
