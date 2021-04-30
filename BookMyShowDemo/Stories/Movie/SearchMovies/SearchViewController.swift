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
        self.viewModel.delegate = self
        self.viewModel.recentSeraches = getRecentSearches()
        viewModel.isSearching = false
        // Do any additional setup after loading the view.
    }
    
    func bookButtonTapped(movie: Results) {
        saveRecentSearches(movie: movie)
    }
    
    func showMovieDetailsView(movie: Results) {
        guard let movieDetails  = MovieStoryboard.detail.controller as? MovieDetailsViewController  else { return }
        movieDetails.viewModel = MovieDetailsViewModel(movie: movie)
        self.present(movieDetails, animated: true, completion: nil)
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
        if searchText == .empty {
            viewModel.isSearching = false
        } else {
            viewModel.isSearching = true
        }
        let results = viewModel.movieList?.results
        let filtered = results?.filter {
            $0.title?.lowercased().split(separator: " ").first {$0.hasPrefix(searchText.lowercased())} != nil
        }
        self.viewModel.filteredMovieList = filtered
    }
    
    func saveRecentSearches(movie: Results) {
        let recentSearches = RecentSearches.init(json: movie)
        self.viewModel.recentSeraches = getRecentSearches()
        if self.viewModel.recentSeraches?.count ?? 0 >= 5 {
            self.viewModel.recentSeraches?.removeFirst()
        }
        
        self.viewModel.recentSeraches = self.viewModel.recentSeraches?.filter({$0.id != recentSearches.id})
        
        self.viewModel.recentSeraches?.append(recentSearches)
        let userDefaults = UserDefaults.standard
        guard let data = self.viewModel.recentSeraches else { return }
        do {
            let encodedData: Data = try NSKeyedArchiver.archivedData(withRootObject: data, requiringSecureCoding: false)
            userDefaults.set(encodedData, forKey: "Recent" )
            userDefaults.synchronize()
            showMovieDetailsView(movie: movie)
        } catch { }
    }
    
    func getRecentSearches() -> [RecentSearches]{
        let userDefaults = UserDefaults.standard
        guard let decoded  = userDefaults.data(forKey: "Recent") else { return [] }
        do {
            let decodeCurrency = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decoded) as! [RecentSearches]
            return decodeCurrency
        } catch { }
        
        return []
    }
}
