//
//  MovieDetailTableViewCell.swift
//  MovieDemo
//
//  Created by craftsvilla on 10/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import UIKit

class MovieDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var labelReleaseDate: UILabel!
    @IBOutlet weak var labelNumberOfVotes: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var imageViewMovie: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpMovie(movie:Movie) {
        self.labelRating.text = "\((movie.voteAverage)!)/10"
        self.labelNumberOfVotes.text = "\((movie.voteCount)!)"
        self.labelReleaseDate.text = movie.releaseDate
        
        if let posterPath = movie.posterPath {
            let url = URL(string:posterPath.getImageUrl(for:R.ImageSize.small))
            self.imageViewMovie.kf.setImage(with:url,
                                            placeholder: UIImage(named: "Placeholder"),
                                            options: nil,
                                            progressBlock: nil,
                                            completionHandler:nil)
        }

    }
    
}
