//
//  RecentSearchTableViewCell.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 30/04/21.
//

import UIKit

class RecentSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundContentView: UIView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieImageVIew: UIImageView!
    
    var recentSearch: RecentSearches? {
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
        setupLabels()
        setupView()
        setupImageView()
    }
    
    func setupLabels() {
        movieNameLabel.font = UIFont.boldSystemFont(ofSize: 15)
    }
    
    func setupImageView() {
        self.movieImageVIew.clipsToBounds = true
        self.movieImageVIew.backgroundColor = .gray
        self.movieImageVIew.layer.cornerRadius = 8.0
    }
    
    func setupView() {
        self.backgroundColor = .clear
        self.backgroundContentView.layer.cornerRadius = 8.0
        self.backgroundContentView.clipsToBounds = true
    }
    
    func updateUI() {
        self.movieNameLabel.text = recentSearch?.movieName ?? .empty
        
        let imageURL = URL(string: URLConstants.imageURL(imageName: recentSearch?.image ?? .empty))
        self.movieImageVIew.sd_setImage(with: imageURL, completed: nil)
    }
    
}
