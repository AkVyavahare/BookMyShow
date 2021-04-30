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
    
}
