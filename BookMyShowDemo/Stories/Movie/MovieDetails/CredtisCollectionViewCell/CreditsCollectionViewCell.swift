//
//  CreditsCollectionViewCell.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 30/04/21.
//

import UIKit

class CreditsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var crewImageView: UIImageView!
    @IBOutlet weak var crewName: UILabel!
    
    var crew: Cast? {
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
        crewImageView.layer.cornerRadius = crewImageView.frame.size.width / 2
    }
    
    func setupUI() {
        setupImageView()
        setupLabel()
    }
    
    func setupImageView() {
        crewImageView.clipsToBounds = true
        crewImageView.layer.cornerRadius = crewImageView.frame.size.width / 2
        crewImageView.backgroundColor = UIColor.gray
        crewImageView.contentMode = .scaleAspectFill
    }
    
    func setupLabel() {
        crewName.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    }
    
    func updateUI() {
        crewName.text = crew?.name ?? .empty
        
       // crewImageView.layer.cornerRadius = crewImageView.frame.size.width / 2
        let imageURL = URL(string: URLConstants.imageURL(imageName: crew?.profilePath ?? .empty))
        self.crewImageView.sd_setImage(with: imageURL, completed: nil)
    }
}
