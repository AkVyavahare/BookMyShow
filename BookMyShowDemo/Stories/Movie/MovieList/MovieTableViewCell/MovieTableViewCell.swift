//
//  MovieTableViewCell.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 27/04/21.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var otherDetailsLabel: UILabel!
    @IBOutlet weak var backgroundContentView: UIView!
    @IBOutlet weak var bookButton: CustomButton!
    var bookButtonTap: ((Results) -> Void)?
    
    var movie: Results? {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupUI() {
        setupView()
        setupLabels()
        setupImageView()
        setupButtons()
    }
    
    func setupLabels() {
        movieTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        releaseDateLabel.font = UIFont.systemFont(ofSize: 15)
        otherDetailsLabel.font = UIFont.systemFont(ofSize: 15)
    }
    
    func setupView() {
        self.backgroundColor = .clear
        self.backgroundContentView.layer.cornerRadius = 8.0
        self.backgroundContentView.clipsToBounds = true
    }
    
    func setupImageView() {
        self.movieImageView.clipsToBounds = true
        self.movieImageView.backgroundColor = .gray
        self.movieImageView.layer.cornerRadius = 8.0
    }
    
    func setupButtons() {
        bookButton.setTitle(StringConstants.book, for: .normal)
        bookButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        bookButton.setTitleColor(.white, for: .normal)
        bookButton.addTarget(self, action: #selector(bookButtonTapped), for: .touchUpInside)
    }
    
    @objc func bookButtonTapped() {
        guard let movie = self.movie else { return }
        bookButtonTap?(movie)
    }
    
    func updateUI() {
        self.movieTitleLabel.text = movie?.title ?? .empty
        self.releaseDateLabel.text = movie?.releaseDate ?? .empty
        self.otherDetailsLabel.text = movie?.overview ?? .empty
        
        let imageURL = URL(string: URLConstants.imageURL(imageName: movie?.posterPath ?? .empty))
        self.movieImageView.sd_setImage(with: imageURL, completed: nil)
    }
    
}

