//
//  MovieListService.swift
//  MovieDemo
//
//  Created by craftsvilla on 11/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire
class MovieListService {
    
    static func fetchMovie(for page:Int,sortBy:String, onComplition: @escaping ([Movie]?,Error?) -> Void) {
        
        let URL = R.apiBaseUrl + R.APIPath.discoverMovie
        let param:[String:Any] = [R.APIParamKey.sortBy:sortBy,
                                  R.APIParamKey.apiKey:R.apiKey,
                                  R.APIParamKey.page:page,
                                  R.APIParamKey.language:R.movieLanguage.english,
                                  R.APIParamKey.voteCount:R.minimumVote]
        
        Alamofire.request(URL,parameters: param).responseObject{ (response: DataResponse<MoviePageResponse>) in
            if let error = response.result.error {
                onComplition(nil,error)
                
            } else {
                let movieResponse = response.result.value
                onComplition((movieResponse?.movies)!,nil)
            }
        }
    }
}
