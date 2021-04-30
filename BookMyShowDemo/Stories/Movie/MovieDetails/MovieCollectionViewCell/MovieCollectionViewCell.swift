//
//  MovieCollectionViewCell.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 30/04/21.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    var movie: MovieListing? {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        // Initialization code
    }
    
    
    func setupUI() {
        setupLabels()
        setupView()
        setupImageView()
    }
    
    func setupLabels() {
        movieTitleLabel.font = UIFont.boldSystemFont(ofSize: 12)
    }
    
    func setupImageView() {
        self.movieImageView.clipsToBounds = true
        self.movieImageView.backgroundColor = .gray
        self.movieImageView.layer.cornerRadius = 8.0
        self.movieImageView.contentMode = .scaleToFill
    }
    
    func setupView() {
     
    }
    
    func updateUI() {
        self.movieTitleLabel.text = movie?.title ?? .empty
        
        let imageURL = URL(string: URLConstants.imageURL(imageName: movie?.posterPath ?? .empty))
        self.movieImageView.sd_setImage(with: imageURL, completed: nil)
    }

}
