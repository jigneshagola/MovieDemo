//
//  MovieHeaderTableViewCell.swift
//  MovieDemo
//
//  Created by craftsvilla on 10/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import UIKit

class MovieHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageViewHeader: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setHeaderView(movie:Movie) {
        
        if let path = movie.backdropPath {
            let url = URL(string: path.getImageUrl(for: R.ImageSize.backdrop))
            self.imageViewHeader.kf.setImage(with:url,
                                             placeholder: UIImage(named: "Placeholder"),
                                             options: nil,
                                             progressBlock: nil,
                                             completionHandler:nil)
        }
        self.labelTitle.text = movie.originalTitle
    }
    
}
