//
//  RootContract.swift
//  MovieDemo
//
//  Created by craftsvilla on 10/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import UIKit

class RootRouter {
    
    static func presentMovieScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = MovieListRouter.assembleModule()
    }
}

