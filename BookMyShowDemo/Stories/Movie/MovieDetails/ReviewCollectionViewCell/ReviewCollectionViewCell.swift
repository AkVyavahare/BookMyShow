//
//  ReviewCollectionViewCell.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 30/04/21.
//

import UIKit

class ReviewCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var contentBackView: UIView!
    @IBOutlet weak var avtarImageView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    
    var review: Reviews? {
        didSet {
            updateUI()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        // Initialization code
    }
    
    override func layoutSubviews() {
        avtarImageView.layer.cornerRadius = avtarImageView.frame.size.width / 2
    }
    
    func setupUI() {
        setupImageView()
        setupLabel()
        setupView()
    }
    
    func setupView() {
        self.contentBackView.clipsToBounds = true
        self.contentBackView.layer.cornerRadius = 8.0
        self.contentBackView.layer.borderWidth = 1.0
        self.contentBackView.layer.borderColor = UIColor.black.cgColor
        
    }
    
    func setupImageView() {
        avtarImageView.clipsToBounds = true
        avtarImageView.layer.cornerRadius = avtarImageView.frame.size.width / 2
        avtarImageView.backgroundColor = UIColor.gray
        avtarImageView.contentMode = .scaleAspectFill
    }
    
    func setupLabel() {
        contentLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    }
    
    func updateUI() {
        contentLabel.text = review?.content ?? .empty
        
        self.avtarImageView.layoutIfNeeded()
        let imageURL = URL(string: URLConstants.imageURL(imageName: review?.authorDetails?.avatarPath ?? .empty))
        self.avtarImageView.sd_setImage(with: imageURL, completed: nil)
    }
}
