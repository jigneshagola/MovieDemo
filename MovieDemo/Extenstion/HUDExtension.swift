//
//  HUDExtension.swift
//  MovieDemo
//
//  Created by craftsvilla on 12/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import Foundation
import UIKit
import PKHUD

protocol Indicatable: class {
    func showActivityIndicator()
    func hideActivityIndicator()
}

extension Indicatable where Self:UIViewController {
    func showActivityIndicator() {
        HUD.show(.progress)
    }
    
    func hideActivityIndicator() {
        HUD.hide()
    }
}
