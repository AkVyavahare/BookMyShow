//
//  SearchViewController+TableView.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 27/04/21.
//

import UIKit

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.isSearching ?? false ? self.viewModel.filteredMovieList?.count ?? 0 : self.viewModel.recentSeraches?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.isSearching ?? false {
            return getMovieCell(tableView: tableView, indexPath: indexPath)
        }
        return getRecentSearchesCell(tableView: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if viewModel.isSearching ?? false {
            return .empty
        }
        return StringConstants.recentlySearched
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if viewModel.isSearching ?? false {
            guard let movie = self.viewModel.movieList?.results?[indexPath.row] else { return }
            showMovieDetailsView(movie: movie)
        } else {
            let recentSearchedMovie = self.viewModel.recentSeraches?[indexPath.row]
            guard let movie = self.viewModel.movieList?.results?.filter({$0.id == recentSearchedMovie?.id}).first else { return  }
            showMovieDetailsView(movie: movie)
            
        }
    }
    
    fileprivate func getMovieCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeReusableCell(MovieTableViewCell.self) else {return UITableViewCell()}
        let movie = self.viewModel?.filteredMovieList?[indexPath.row]
        cell.movie = movie
        cell.bookButtonTap = bookButtonTapped
        return cell
    }
    
    fileprivate func getRecentSearchesCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeReusableCell(RecentSearchTableViewCell.self) else {return UITableViewCell()}
        let recentSearch = self.viewModel?.recentSeraches?[indexPath.row]
        cell.recentSearch = recentSearch
        return cell
    }
    
}
