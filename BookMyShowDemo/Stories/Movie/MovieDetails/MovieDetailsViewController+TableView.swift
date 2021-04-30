//
//  MovieDetailsViewController+TableView.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 30/04/21.
//

import UIKit

extension MovieDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
