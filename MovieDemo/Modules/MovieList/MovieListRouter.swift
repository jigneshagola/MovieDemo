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
    private(set) var sortCompletion: ((SortType) -> ())?
    
    static func assembleModule() -> UIViewController {
        let storyBoard = UIStoryboard(name: R.StoryBoard.main, bundle: nil);
        
        let router = MovieListRouter()
        let interactor = MovieListInteractor()
        
        let view = storyBoard.instantiateViewController(withIdentifier: R.ViewControllerID.movieList) as! MovieListViewController;
        router.viewController = view

        let navigation = UINavigationController(rootViewController: router.viewController!)
        let presenter = MovieListPresenter()
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return navigation
    }
    
    func presentSortOptions(sortCompletion: ((SortType) -> ())?) {
        self.sortCompletion = sortCompletion

        let alert = UIAlertController(
            title: "Sort by",
            message: nil,
            preferredStyle: .actionSheet
        )
        
        alert.addAction(UIAlertAction(
            title: "Popularity",
            style: .default,
            handler: { (alert: UIAlertAction!) in
                self.sortCompletion!(.popularity)
        }))
        
        alert.addAction(UIAlertAction(
            title: "Highest rated",
            style: .default,
            handler: { (alert: UIAlertAction!) in
                self.sortCompletion!(.highestRated)
        }))
        
        alert.addAction(UIAlertAction(
            title: "Cancel",
            style: .default,
            handler: nil
        ))
        
        self.viewController?.present(alert, animated: true, completion: nil)
    }
    
    func presentDetails(forArticle article: Movie) {
        
    }
    
}
