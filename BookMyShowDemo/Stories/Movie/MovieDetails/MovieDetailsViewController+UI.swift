//
//  MovieDetailsViewController+UI.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 30/04/21.
//

import UIKit


extension MovieDetailsViewController {
    
    func setupUI() {
        setupImageView()
        setupLabels()
        setupCrewCollectionView()
        setupCastCollectionView()
        setupSimilarMoviesCollectionView()
    }
    
    func setupLabels() {
        overviewLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        overviewLabel.text = viewModel.movie?.overview ?? .empty
        
        movieNameLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        movieNameLabel.textColor = UIColor.white
        movieNameLabel.text = "\(viewModel.movie?.title ?? .empty)\n\(viewModel.movie?.releaseDate ?? .empty)"
        
        synopsisTitleLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        synopsisTitleLabel.textColor = UIColor.black
        synopsisTitleLabel.text = StringConstants.synopsis
        
        castTitleLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        castTitleLabel.text = StringConstants.cast
        
        crewTitleLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        crewTitleLabel.text = StringConstants.crew
        
        similarMoviesTitleLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        similarMoviesTitleLabel.text = StringConstants.youMightAlsoLike
    }
    
    func setupImageView() {
        let imageURL = URL(string: URLConstants.imageURL(imageName: viewModel.movie?.backdropPath ?? .empty))
        self.backDropImageView.sd_setImage(with: imageURL, completed: nil)
    }
    
    private func setupCrewCollectionView() {
        
        let cellWidth: CGFloat = ((self.view.frame.size.width / 3.0))
        let cellheight: CGFloat = self.crewCollectionView.frame.size.height
        let cellSize = CGSize(width: cellWidth, height: cellheight)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal //.horizontal
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.minimumLineSpacing = 2.0
        layout.minimumInteritemSpacing = 2.0
        crewCollectionView.setCollectionViewLayout(layout, animated: true)
        crewCollectionView.register(UINib.init(nibName: CreditsCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CreditsCollectionViewCell.identifier)
        crewCollectionView.isScrollEnabled = true
        crewCollectionView.showsHorizontalScrollIndicator = false
        crewCollectionView.delegate = self
        crewCollectionView.dataSource = self
        crewCollectionView.backgroundColor = UIColor.clear
        crewCollectionView.reloadData()
    }
    
    private func setupCastCollectionView() {
        
        let cellWidth: CGFloat = ((self.view.frame.size.width / 3.0))
        let cellheight: CGFloat = self.crewCollectionView.frame.size.height
        let cellSize = CGSize(width: cellWidth, height: cellheight)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal //.horizontal
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.minimumLineSpacing = 2.0
        layout.minimumInteritemSpacing = 2.0
        castCollectionView.setCollectionViewLayout(layout, animated: true)
        castCollectionView.register(UINib.init(nibName: CreditsCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CreditsCollectionViewCell.identifier)
        castCollectionView.isScrollEnabled = true
        castCollectionView.showsHorizontalScrollIndicator = false
        castCollectionView.delegate = self
        castCollectionView.dataSource = self
        castCollectionView.backgroundColor = UIColor.clear
        castCollectionView.reloadData()
    }
    
    private func setupSimilarMoviesCollectionView() {
        
        let cellWidth: CGFloat = ((self.view.frame.size.width / 3.0) - 15.0)
        let cellheight: CGFloat = self.similarMoviesCollectionView.frame.size.height
        let cellSize = CGSize(width: cellWidth, height: cellheight)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal //.horizontal
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.minimumLineSpacing = 8.0
        layout.minimumInteritemSpacing = 8.0
        similarMoviesCollectionView.setCollectionViewLayout(layout, animated: true)
        similarMoviesCollectionView.register(UINib.init(nibName: MovieCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        similarMoviesCollectionView.isScrollEnabled = true
        similarMoviesCollectionView.showsHorizontalScrollIndicator = false
        similarMoviesCollectionView.delegate = self
        similarMoviesCollectionView.dataSource = self
        similarMoviesCollectionView.backgroundColor = UIColor.clear
        similarMoviesCollectionView.reloadData()
    }
    
    func updateUI() {
        crewCollectionView.reloadData()
        castCollectionView.reloadData()
        similarMoviesCollectionView.reloadData()
    }
    
}
