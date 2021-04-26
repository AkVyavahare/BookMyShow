//
//  MovieListViewController+UI.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 27/04/21.
//

import Foundation

protocol MovieListViewModelDelegate: class {
    func viewModelDidUpdate(_ viewModel: MovieListViewModel)
}

class MovieListViewModel {

    weak var delegate: MovieListViewModelDelegate?

    var apiSuccess: (() -> Void)?
    var apiFailure: ((ErrorResponse) -> Void)?
    
    init() {
    }
}
