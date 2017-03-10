//
//  MovieListRouter.swift
//  MovieDemo
//
//  Created by craftsvilla on 10/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import UIKit

class MovieListRouter: IMovieListRouter {
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let storyBoard = UIStoryboard(name: R.StoryBoard.main, bundle: nil);
        
        let router = MovieListRouter()
        
        let view = storyBoard.instantiateViewController(withIdentifier: R.ViewControllerID.movieList) as! MovieListViewController;
        router.viewController! = view

        let navigation = UINavigationController(rootViewController: router.viewController!)
        let presenter = MovieListPresenter()
        view.presenter = presenter
        
        return navigation
    }
}
