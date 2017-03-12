//
//  MovieDetailPresenter.swift
//  MovieDemo
//
//  Created by craftsvilla on 11/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import UIKit

class MovieDetailPresenter:IMovieDetailPresenter {
    var view: IMovieDetailView?
    var movie:Movie!
    func viewDidLoad() {
        view?.showDetails(for: self.movie)
    }
}
