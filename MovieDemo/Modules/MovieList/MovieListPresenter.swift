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
        self.view?.showActivityIndicator()
        self.fetchMoreMovies()
    }
    
    func moviesFetched(movies:[Movie]) {
        
        if movies.count < 20 {
            self.isMoreDataAvailable = false
        }
        
        if currentPage == 1 {
            self.view?.hideActivityIndicator()
        }
        self.movies = self.movies + movies
        self.view?.showMoviesData(movies: self.movies)
    }
    
    func moviesFethingFailed(error: Error) {
        currentPage = currentPage - 1
        self.view?.hideActivityIndicator()
        self.router.showError(with: "OOPS!", messege: error.localizedDescription, retryCallBack: {
            self.fetchMoreMovies()
        })
    }
    
    func fetchMoreMovies() {
        if isMoreDataAvailable == true {
            currentPage = currentPage + 1
            self.interactor.fetchMovie(for: self.currentPage, sortType: self.sortType)
        }
    }
    
    func didClickSortButton() {
        router.presentSortOptions { (sortType) in
            self.onSelected(sortType: sortType)
        }
    }
    
    func onSelected(sortType:SortType) {
        if self.sortType != sortType {
            self.sortType = sortType
            self.currentPage = 0
            self.isMoreDataAvailable = true
            self.movies.removeAll()
            self.fetchMoreMovies()
        }
    }
    
    func didSelectMovie(movie: Movie) {
        self.router.presentDetails(for: movie)
    }
    
    func searchMovie(for searchText:String) {
        
        let whitespaceCharacterSet = CharacterSet.whitespaces
        let strippedString = searchText.trimmingCharacters(in: whitespaceCharacterSet)
        
        let searchedMovies = self.movies.filter {
            return $0.title.range(of: strippedString, options: .caseInsensitive) != nil
        }
        
        if searchedMovies.count == 0 { self.view?.displayNoSearchResult() }
        else { self.view?.displaySearchResult(for: searchedMovies) }
        
    }
}
