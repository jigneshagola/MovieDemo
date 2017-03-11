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
}

protocol IMovieListPresenter {
    weak var view: IMovieListView? { get set }
    var router:IMovieListRouter! { get set }
    var interactor:IMovieListInteractor! { get set }
    var movies:[Movie] { get set }
    
    func viewDidLoad()
    func fetchMoreMovies()
    func moviesFetched(movies:[Movie]) 
    func didClickSortButton()
    func didSelectMovie(movie: Movie)
}

protocol IMovieListInteractor {
    var presenter: IMovieListPresenter! { get set }
    
    func fetchMovie(for page:Int,sortType:SortType)
    func movieFetched(movie: [Movie])
    func movieFetchFailed()
}

protocol IMovieListView: class {
    var presenter: IMovieListPresenter! { get set }
    
    func showNoContentScreen()
    func showMoviesData(movies: [Movie])
}
