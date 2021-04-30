//
//  MovieDetailsViewController+CollectionView.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 30/04/21.
//

import UIKit

extension MovieDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.credits?.crew?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return getCrewCell(collectionView, indexPath: indexPath)
    }
    
    func getCrewCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CreditsCollectionViewCell.identifier,
                                                            for: indexPath) as? CreditsCollectionViewCell else {fatalError(StringConstants.somethingWentWrong)}
        let crew = viewModel.credits?.crew?[indexPath.row]
        cell.crew = crew
        return cell
    }
    
    
}
