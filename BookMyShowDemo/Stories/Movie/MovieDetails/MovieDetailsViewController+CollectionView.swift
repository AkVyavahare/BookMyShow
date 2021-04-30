//
//  MovieDetailsViewController+CollectionView.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 30/04/21.
//

import UIKit

extension MovieDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
