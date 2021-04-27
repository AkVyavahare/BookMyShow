//
//  MovieViewController+TableView.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 27/04/21.
//

import UIKit

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.movieList?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getMovieCell(tableView: tableView, indexPath: indexPath)
    }
    
    fileprivate func getMovieCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeReusableCell(MovieTableViewCell.self) else {return UITableViewCell()}
        let movie = self.viewModel.movieList?.results?[indexPath.row]
        cell.movie = movie
        cell.bookButtonTap = bookButtonTapped
        return cell
    }
}
