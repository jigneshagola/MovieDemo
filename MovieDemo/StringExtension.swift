//
//  StringExtension.swift
//  MovieDemo
//
//  Created by craftsvilla on 11/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import Foundation
extension String {
    func getImageUrl(for width:String) -> String {
        return R.imageBaseUrl + width + self;
    }
}

