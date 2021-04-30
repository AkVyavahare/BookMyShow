//
//  MovieDetailsViewModel.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 30/04/21.
//

import Foundation

protocol MovieDetailsViewModelDelegate: class {
    func viewModelDidUpdate(_ viewModel: MovieDetailsViewModel)
}

class MovieDetailsViewModel {

    weak var delegate: MovieDetailsViewModelDelegate?
    
    var movie: Results? {
        didSet {
            delegate?.viewModelDidUpdate(self)
        }
    }
    
    var credits: Credits? {
        didSet {
            delegate?.viewModelDidUpdate(self)
        }
    }
    
    init(movie: Results) {
        self.movie = movie
    }
    
    func getMovieReviews(movieId: Int) {
        let router = MovieRouter()
        router.getMovieReviews(config: .getReviews(movieId)) { (res) in
            switch res {
            case .success(let reviews):
                print(reviews)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func getMovieCredits(movieId: Int) {
        let router = MovieRouter()
        router.getMovieCredits(config: .getCredits(movieId)) { (res) in
            switch res {
            case .success(let credits):
                self.credits = credits
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func getSimilarMovies(movieId: Int) {
        let router = MovieRouter()
        router.getSimilarMovies(config: .getSimilarMovies(movieId)) { (res) in
            switch res {
            case .success(let movieList):
                print(movieList)
            case .failure(let err):
                print(err)
            }
        }
    }
}
