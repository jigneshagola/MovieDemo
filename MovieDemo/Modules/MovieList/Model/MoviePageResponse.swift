//
//  MoviePageResponse.swift
//  MovieDemo
//
//  Created by craftsvilla on 11/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import UIKit
import ObjectMapper

class MoviePageResponse: Mappable{
    var page:Int?
    var totalResults:Int?
    var totalPages:Int?
    var movies:[Movie]?
    
    func mapping(map: Map) {
        self.page <- map["page"]
        self.totalResults <- map["total_results"]
        self.totalPages <- map["total_pages"]
        self.movies <- map["results"]
    }
    
    required init?(map: Map) {
        
    }
}
