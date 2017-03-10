//
//  MovieListRouter.swift
//  MovieDemo
//
//  Created by craftsvilla on 10/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import UIKit

class MovieListRouter: MovieListWireFream {
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let storyBoard = UIStoryboard(name: R.StoryBoard.main, bundle: nil);
        
        let router = MovieListRouter()
        
        router.viewController = storyBoard.instantiateViewController(withIdentifier: R.ViewControllerID.movieList);
        let navigation = UINavigationController(rootViewController: router.viewController!)
        return navigation
    }
}
