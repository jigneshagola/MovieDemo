//
//  MovieListPresenterTests.swift
//  MovieDemo
//
//  Created by craftsvilla on 11/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import XCTest
import ObjectMapper

class MovieListPresenterTests: XCTestCase {
    
    var movieListPresenter:MovieListPresenter?

    override func setUp() {
        super.setUp()
       
        self.movieListPresenter = MovieListPresenter()
        
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
        let movie1 = Movie(map: Map(mappingType: .fromJSON, JSON: ["id" : 1]))
        let movie2 = Movie(map: Map(mappingType: .fromJSON, JSON: ["id" : 2]))
        self.movieListPresenter?.movies.append(movie1!)
        self.movieListPresenter?.movies.append(movie2!)
        
        class DummyVC:MovieListViewController {
            var isShowMoviesCalled = false
            override func showMoviesData(movies: [Movie]) {
                self.isShowMoviesCalled = true
            }
        }
        
        self.movieListPresenter?.view = DummyVC()
        self.movieListPresenter?.moviesFetched(movies: [movie1!,movie2!,movie1!,movie2!,movie1!,movie2!,movie1!,movie2!,movie1!,movie2!])
        
        XCTAssertTrue((self.movieListPresenter?.isMoreDataAvailable)!)
        XCTAssertEqual(self.movieListPresenter?.movies.count, 12)
        XCTAssertTrue((self.movieListPresenter?.view as! DummyVC).isShowMoviesCalled)
        
        self.movieListPresenter?.moviesFetched(movies: [movie1!,movie2!])
        
        XCTAssertFalse((self.movieListPresenter?.isMoreDataAvailable)!)
        XCTAssertEqual(self.movieListPresenter?.movies.count, 14)
        
    }
    
}
