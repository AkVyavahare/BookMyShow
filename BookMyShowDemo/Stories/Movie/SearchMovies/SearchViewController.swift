//
//  SearchViewController.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 27/04/21.
//

import UIKit

class SearchViewController: UIViewController {

    var viewModel: SearchViewModel!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var moviesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
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

extension SearchViewController: SearchViewModelDelegate {
    func viewModelDidUpdate(_ viewModel: SearchViewModel) {
        self.viewModel = viewModel
        updateUI()
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let results = viewModel.movieList?.results
        let filtered = results?.filter {
            $0.title?.lowercased().split(separator: " ").first {$0.hasPrefix(searchText.lowercased())} != nil
        }
        
        self.viewModel.filteredMovieList = filtered
        updateUI()
    }
}
