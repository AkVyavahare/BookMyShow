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
            updateCrewUI()
        }
    }
    
    var cast: Cast? {
        didSet {
            updateCastUI()
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
    
    func updateCrewUI() {
        crewName.text = crew?.name ?? .empty
        
        self.crewImageView.layoutIfNeeded()
        let imageURL = URL(string: URLConstants.imageURL(imageName: crew?.profilePath ?? .empty))
        self.crewImageView.sd_setImage(with: imageURL, completed: nil)
    }
    
    func updateCastUI() {
        crewName.text = cast?.name ?? .empty
        
        self.crewImageView.layoutIfNeeded()
        let imageURL = URL(string: URLConstants.imageURL(imageName: cast?.profilePath ?? .empty))
        self.crewImageView.sd_setImage(with: imageURL, completed: nil)
    }
}
