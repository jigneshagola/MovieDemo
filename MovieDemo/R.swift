//
//  R.swift
//  MovieDemo
//
//  Created by craftsvilla on 10/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import Foundation


//Resource Constant File
struct R {
    struct ViewControllerID {
        static let movieList =  "MovieListViewController"
        static let movieDetail = "MovieDetailViewController"
    }
    struct StoryBoard {
        static let main = "Main"
    }
    struct CellId {
        static let movieList = "MovieCollectionViewCell"
        static let movieDetailHeader = "MovieHeaderTableViewCell"
        static let movieDetail = "MovieDetailTableViewCell"
    }
    
    static let apiBaseUrl = "https://api.themoviedb.org/3"
    static let imageBaseUrl = "https://image.tmdb.org/t/p/"
    
    struct ImageSize {
        static let thumbnil = "w154"
        static let small = "w92"
        static let backdrop = "w342"
    }
    
    struct movieLanguage {
        static let english = "en"
    }
    
    static let apiKey = "17be64f009f004298adba6df55c59ec4"
    static let perPage = 20
    static let minimumVote = 100
    
    struct APIPath {
        static let discoverMovie = "/discover/movie"
    }
    
    struct APIParamKey {
        static let sortBy = "sort_by"
        static let apiKey = "api_key"
        static let page = "page"
        static let language =  "with_original_language"
        static let voteCount = "vote_count.gte"
        
    }
}
