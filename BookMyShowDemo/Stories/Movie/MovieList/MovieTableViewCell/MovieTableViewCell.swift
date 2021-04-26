//
//  MovieTableViewCell.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 27/04/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var otherDetailsLabel: UILabel!
    @IBOutlet weak var backgroundContentView: UIView!
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
        setupImageView()
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
    
}
