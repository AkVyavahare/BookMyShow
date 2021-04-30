//
//  MovieListViewModel.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 27/04/21.
//

import UIKit
import Foundation

protocol MovieListViewModelDelegate: class {
    func viewModelDidUpdate(_ viewModel: MovieListViewModel)
}

class MovieListViewModel {

    weak var delegate: MovieListViewModelDelegate?

    var apiSuccess: (() -> Void)?
    var apiFailure: ((ErrorResponse) -> Void)?
    
    var movieList: MovieList? {
        didSet {
            delegate?.viewModelDidUpdate(self)
        }
    }
    
    init() {
    }
    
    func getMovieList() {
        let router = MovieRouter()
        router.getMovies(config: .getMovies) { (res) in
            switch res {
            case .success(let movies):
                self.movieList = movies
            case .failure(let err):
                print(err)
            }
        }
    }
}
