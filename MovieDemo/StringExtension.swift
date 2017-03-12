//
//  StringExtension.swift
//  MovieDemo
//
//  Created by craftsvilla on 11/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import Foundation
import UIKit
extension String {
    func getImageUrl(for width:String) -> String {
        return R.imageBaseUrl + width + self;
    }
    
    func heightWithConstrainedWidth(_ width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return boundingBox.height
    }
}

