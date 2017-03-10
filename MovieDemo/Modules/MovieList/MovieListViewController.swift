//
//  MovieListViewController.swift
//  MovieDemo
//
//  Created by craftsvilla on 10/03/17.
//  Copyright © 2017 jk. All rights reserved.
//

import UIKit
import Kingfisher
class MovieListViewController: UIViewController,IMovieListView {
    
    var presenter: IMovieListPresenter!
    var movies: [Movie] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showNoContentScreen() {
        
    }

    func showMoviesData(movies: [Movie]) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MovieListViewController:UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        
        let movie = self.movies[indexPath.row]
        cell.labelMovieTitle.text = movie.title
        
        if let path = movie.posterPath {
            let totalPath = "https://image.tmdb.org/t/p/w154/" + path
            let url = URL(string: totalPath)
            cell.imageViewMovie.kf.setImage(with:url,
                                            placeholder: UIImage(named: "Placeholder"),
                                            options: nil,
                                            progressBlock: nil,
                                            completionHandler:nil)
        }
        
        return cell;
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = self.movies[indexPath.row]
        self.performSegue(withIdentifier: "detailSegue", sender: movie)
    }
}
