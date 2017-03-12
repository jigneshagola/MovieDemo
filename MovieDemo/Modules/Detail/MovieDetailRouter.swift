//
//  MovieDetailRouter.swift
//  MovieDemo
//
//  Created by craftsvilla on 11/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import UIKit

class MovieDetailRouter:IMovieDetailRouter {
    static func assembleModule(movie: Movie) -> UIViewController {
        
        let storyBoard = UIStoryboard(name: R.StoryBoard.main, bundle: nil)
        let view = storyBoard.instantiateViewController(withIdentifier: R.ViewControllerID.movieDetail) as! MovieDetailViewController
        let presenter = MovieDetailPresenter()
        
        presenter.view = view
        presenter.movie = movie
        view.presenter = presenter
        
        return view
    }
}
