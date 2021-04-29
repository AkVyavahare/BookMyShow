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
    @IBOutlet weak var searchButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.delegate = self
        viewModel.getMovieList()
        // Do any additional setup after loading the view.
    }
    
    func bookButtonTapped(movie: Results) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueSearchView" {
            if let destVC = segue.destination as? SearchViewController {
                destVC.viewModel = SearchViewModel()
                destVC.viewModel.movieList = viewModel.movieList
            }
        }
    }
}

extension MovieListViewController: MovieListViewModelDelegate {
    func viewModelDidUpdate(_ viewModel: MovieListViewModel) {
        self.viewModel = viewModel
        updateUI()
    }
}
