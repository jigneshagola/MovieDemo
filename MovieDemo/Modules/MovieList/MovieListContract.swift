//
//  Contract.swift
//  MovieDemo
//
//  Created by craftsvilla on 10/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import UIKit

protocol MovieListWireFream {
    weak var viewController: UIViewController? { get set }
    static func assembleModule() -> UIViewController
}
