//
//  MovieCollectionViewCell.swift
//  MovieDemo
//
//  Created by craftsvilla on 11/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageViewMovie: UIImageView!
    @IBOutlet weak var labelMovieTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpCell(movie:Movie) {
        self.labelMovieTitle.text = movie.title
        if let path = movie.posterPath {
            
            let url = URL(string: path.getImageUrl(for: R.ImageSize.thumbnil))
            self.imageViewMovie.kf.setImage(with:url,
                                            placeholder: UIImage(named: "Placeholder"),
                                            options: nil,
                                            progressBlock: nil,
                                            completionHandler:nil)
        }

    }
}
