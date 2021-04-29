//
//  SearchViewModel.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 27/04/21.
//

import Foundation

protocol SearchViewModelDelegate: class {
    func viewModelDidUpdate(_ viewModel: SearchViewModel)
}

class SearchViewModel {

    weak var delegate: SearchViewModelDelegate?

    var apiSuccess: (() -> Void)?
    var apiFailure: ((ErrorResponse) -> Void)?
    
    var isSearching: Bool? {
        didSet {
            delegate?.viewModelDidUpdate(self)
        }
    }
    
    var movieList: MovieList? {
        didSet {
            delegate?.viewModelDidUpdate(self)
        }
    }
    
    var filteredMovieList: [Results]? {
        didSet {
            delegate?.viewModelDidUpdate(self)
        }
    }
    
    var recentSeraches: [RecentSearches]? {
        didSet {
            
        }
    }
    
    init() {
    }
}
