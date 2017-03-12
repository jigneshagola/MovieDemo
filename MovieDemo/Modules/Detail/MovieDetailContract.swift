//
//  MovieDetailContract.swift
//  MovieDemo
//
//  Created by craftsvilla on 11/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import Foundation
import UIKit
protocol IMovieDetailView: class {
    var presenter: IMovieDetailPresenter! { get set }
    
    func showDetails(for movie: Movie)
}

protocol IMovieDetailPresenter: class {
    weak var view: IMovieDetailView? { get set }
    func viewDidLoad()
}

protocol IMovieDetailRouter: class {
    static func assembleModule(movie: Movie) -> UIViewController
}
