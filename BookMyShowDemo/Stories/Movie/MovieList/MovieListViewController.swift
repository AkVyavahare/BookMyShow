//
//  MovieListViewController.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 27/04/21.
//

import UIKit

class MovieListViewController: UIViewController {
    
    var viewModel = MovieListViewModel()
    
    @IBOutlet weak var movieListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.delegate = self
        viewModel.getMovieList()
        // Do any additional setup after loading the view.
    }
    
    @objc func bookButtonTapped() {
        
    }
}

extension MovieListViewController: MovieListViewModelDelegate {
    func viewModelDidUpdate(_ viewModel: MovieListViewModel) {
        self.viewModel = viewModel
        updateUI()
    }
}
