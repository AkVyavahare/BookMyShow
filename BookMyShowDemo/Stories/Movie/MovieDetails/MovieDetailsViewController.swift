//
//  MovieDetailsViewController.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 30/04/21.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    var viewModel: MovieDetailsViewModel!
    
    @IBOutlet weak var castCollectionView: UICollectionView!
    @IBOutlet weak var similarMoviesTitleLabel: UILabel!
    @IBOutlet weak var crewTitleLabel: UILabel!
    @IBOutlet weak var castTitleLabel: UILabel!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var synopsisTitleLabel: UILabel!
    @IBOutlet weak var backDropImageView: UIImageView!
    @IBOutlet weak var crewCollectionView: UICollectionView!
    @IBOutlet weak var similarMoviesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setupUI()
        getMovieCredits()
        getMoviewReviews()
        getSimilarMovies()
        // Do any additional setup after loading the view.
    }
    
    func getMoviewReviews() {
        viewModel.getMovieReviews(movieId: viewModel.movie?.id ?? 0)
    }
    
    func getMovieCredits() {
        viewModel.getMovieCredits(movieId: viewModel.movie?.id ?? 0)
    }
    
    func getSimilarMovies() {
        viewModel.getSimilarMovies(movieId: viewModel.movie?.id ?? 0)
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension MovieDetailsViewController: MovieDetailsViewModelDelegate {
    func viewModelDidUpdate(_ viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
        updateUI()
    }
    
    
}

