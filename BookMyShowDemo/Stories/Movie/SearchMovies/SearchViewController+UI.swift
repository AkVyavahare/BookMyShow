//
//  SerachViewController+UI.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 27/04/21.
//

import UIKit

extension SearchViewController {
    func setupUI() {
        setupTableView()
        setupSearchBar()
    }
    
    func setupTableView() {
        self.moviesTableView.register(MovieTableViewCell.self)
        self.moviesTableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        self.moviesTableView.delegate = self
        self.moviesTableView.dataSource = self
        self.moviesTableView.separatorStyle = .none
        self.moviesTableView.separatorInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        self.moviesTableView.allowsSelection = true
        self.moviesTableView.backgroundColor = UIColor.clear
        self.moviesTableView.reloadData()
    }
    
    func setupSearchBar() {
        searchBar.delegate = self
    }
    
    func updateUI() {
        self.moviesTableView.reloadData()
    }
}
