//
//  Contract.swift
//  MovieDemo
//
//  Created by craftsvilla on 10/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import UIKit

protocol IMovieListRouter {
    weak var viewController: UIViewController? { get set }
    static func assembleModule() -> UIViewController
    
    func presentSortOptions(sortCompletion: ((SortType) -> ())?)
    func presentDetails(for movie: Movie)
    
    func showError(with title: String, messege: String,retryCallBack:@escaping () -> Void)
}

protocol IMovieListPresenter:class {
    weak var view: IMovieListView? { get set }
    var router:IMovieListRouter! { get set }
    var interactor:IMovieListInteractor! { get set }
    var movies:[Movie] { get set }
    
    func viewDidLoad()
    
    func fetchMoreMovies()
    func moviesFetched(movies:[Movie]) 
    func moviesFethingFailed(error:Error)
    
    func didClickSortButton()
    func didSelectMovie(movie: Movie)
 
    func searchMovie(for searchText:String)
}

protocol IMovieListInteractor: class {
    var presenter: IMovieListPresenter! { get set }
    
    func fetchMovie(for page:Int,sortType:SortType)
    
    func movieFetched(movies: [Movie])
    func movieFetchFailed(with error:Error)
}

protocol IMovieListView: Indicatable {
    var presenter: IMovieListPresenter! { get set }
    
    func showMoviesData(movies: [Movie])
    
    func displaySearchResult(for movies:[Movie])
    func displayNoSearchResult()
}
