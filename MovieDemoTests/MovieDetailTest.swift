//
//  MovieDetailTest.swift
//  MovieDemo
//
//  Created by craftsvilla on 11/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import XCTest
import ObjectMapper
class MovieDetailTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShowDetail() {
        class DummyView:MovieDetailViewController {
            var isMethodCalled = false
            override func showDetails(for movie: Movie) {
                self.isMethodCalled = true
            }
        }
        
        let presenter = MovieDetailPresenter()
        let view = DummyView()
        
        presenter.view = view
        presenter.movie =  Movie(map: Map(mappingType: .fromJSON, JSON: ["id" : 2]))
        presenter.viewDidLoad()
        XCTAssertTrue(view.isMethodCalled)
    }
}
