//
//  MovieListViewModel.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 27/04/21.
//

import UIKit

extension MovieListViewController {
    func setupUI() {
        setupTableView()
    }
    
    func setupTableView() {
        self.movieListTableView.register(MovieTableViewCell.self)
        self.movieListTableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        self.movieListTableView.delegate = self
        self.movieListTableView.dataSource = self
        self.movieListTableView.separatorStyle = .none
        self.movieListTableView.separatorInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        self.movieListTableView.allowsSelection = true
        self.movieListTableView.backgroundColor = UIColor.clear
        self.movieListTableView.reloadData()
    }
}
