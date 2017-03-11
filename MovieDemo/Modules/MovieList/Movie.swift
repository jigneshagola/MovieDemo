//
//  Movie.swift
//  MovieDemo
//
//  Created by craftsvilla on 10/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import UIKit
import ObjectMapper
class Movie: Mappable {
    
    var id:Int!
    var posterPath:String?
    var title:String!
    var originalTitle:String?
    var backdropPath:String?
    var voteAverage:Float?
    var releaseDate:String?
    var overview:String?
    var voteCount:Int?
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.posterPath <- map["poster_path"]
        self.title <- map["title"]
        self.backdropPath <- map["backdrop_path"]
        self.voteAverage <- map["vote_average"]
        self.originalTitle <- map["original_title"]
        self.releaseDate <- map["release_date"]
        self.overview <- map["overview"]
        self.voteCount <- map["vote_count"]
    }
    
    required init?(map: Map) {
        
    }
}
