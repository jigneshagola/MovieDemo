//
//  MovieListPresenterTests.swift
//  MovieDemo
//
//  Created by craftsvilla on 11/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import XCTest
import ObjectMapper

class MovieListTests: XCTestCase {
    
    var movieListPresenter:MovieListPresenter!
    
    override func setUp() {
        super.setUp()
        
        self.movieListPresenter = MovieListPresenter()
        let interactor = MovieListInteractor()
        let router = MovieListRouter()
        
        movieListPresenter.interactor = interactor
        movieListPresenter.router = router
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSortTypeSelection() {
        
        //Mock Object for Interactor
        class DummyInteractor:MovieListInteractor {
            var isFetchMovieCalled = false
            override func fetchMovie(for page: Int, sortType: SortType) {
                self.isFetchMovieCalled = true
            }
        }
        
        self.movieListPresenter?.interactor = DummyInteractor()
        self.movieListPresenter?.sortType = .highestRated
        self.movieListPresenter?.currentPage = 4
        self.movieListPresenter?.onSelected(sortType: .highestRated)
        
        XCTAssertEqual(self.movieListPresenter?.currentPage, 4)
        XCTAssertEqual(self.movieListPresenter?.sortType, .highestRated)
        
        self.movieListPresenter?.onSelected(sortType: .popularity)
        XCTAssertEqual(self.movieListPresenter?.currentPage, 1)
        XCTAssertEqual(self.movieListPresenter?.sortType, .popularity)
        XCTAssertTrue((self.movieListPresenter?.interactor as! DummyInteractor).isFetchMovieCalled)
    }
    
    func testMoviesFetched() {
        
        let movie1 = Movie(map: Map(mappingType: .fromJSON, JSON: ["id" : 1,"title":"X Man"]))
        let movie2 = Movie(map: Map(mappingType: .fromJSON, JSON: ["id" : 2,"title":"Logan"]))
        
        self.movieListPresenter?.movies.append(movie1!)
        self.movieListPresenter?.movies.append(movie2!)
        
        class DummyVC:MovieListViewController {
            var isShowMoviesCalled = false
    
            override func showMoviesData(movies: [Movie]) {
                self.isShowMoviesCalled = true
            }
        }
        
        let view = DummyVC()
        self.movieListPresenter?.view = view
        
        var movies = [Movie]()
        for _ in 1...R.perPage {
            movies.append(movie1!)
        }
        self.movieListPresenter?.moviesFetched(movies:movies)
        
        XCTAssertTrue((self.movieListPresenter?.isMoreDataAvailable)!)
        XCTAssertEqual(self.movieListPresenter?.movies.count, 22)
        XCTAssertTrue(view.isShowMoviesCalled)
        
        self.movieListPresenter?.moviesFetched(movies: [movie1!,movie2!])
        
        XCTAssertFalse((self.movieListPresenter?.isMoreDataAvailable)!)
        XCTAssertEqual(self.movieListPresenter?.movies.count, 24)
        
    }
    
    func testMovieFetchingFailed() {
        self.movieListPresenter.isMoreDataAvailable = true
        self.movieListPresenter.fetchMoreMovies()
        self.movieListPresenter.moviesFethingFailed(error: NSError(domain:"", code: 0, userInfo:[NSLocalizedDescriptionKey:""]))
        
        
        //On api fail current page should be decremented by 1 coz we increse current page count while fetching
        XCTAssertEqual(self.movieListPresenter.currentPage,0)
    }
    
    func testSearch() {
        self.movieListPresenter.movies.removeAll()
        
        let movie1 = Movie(map: Map(mappingType: .fromJSON, JSON: ["id" : 1,"title":"X Man"]))
        let movie2 = Movie(map: Map(mappingType: .fromJSON, JSON: ["id" : 2,"title":"Logan"]))
        
        self.movieListPresenter?.movies.append(movie1!)
        self.movieListPresenter?.movies.append(movie2!)
        
        class DummyVC:MovieListViewController {
            var isDisplayResultcalled = false
            var searchResult:[Movie]?
            var isDisplayNoSearchResultCalled = false
            
            override func displaySearchResult(for movies: [Movie]) {
                self.isDisplayResultcalled = true;
                self.searchResult = movies
            }
            
            override func displayNoSearchResult() {
                self.isDisplayNoSearchResultCalled = true
            }
        }
        let view = DummyVC()
        self.movieListPresenter.view = view
        self.movieListPresenter.searchMovie(for: "Log")
        
        XCTAssertTrue(view.isDisplayResultcalled)
        XCTAssertEqual(view.searchResult?[0].title,"Logan")
        
        self.movieListPresenter.searchMovie(for: "")
        XCTAssertTrue(view.isDisplayNoSearchResultCalled)
    }
    
}
