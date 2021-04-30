//
//  MovieDetailsViewController+CollectionView.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 30/04/21.
//

import UIKit

extension MovieDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case crewCollectionView:
            return viewModel.credits?.crew?.count ?? 0
        case castCollectionView:
            return viewModel.credits?.cast?.count ?? 0
        case similarMoviesCollectionView:
            return viewModel.similarMovies?.results?.count ?? 0
        case reviewsCollectionView:
            return viewModel.reviews?.results?.count ?? 0
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case crewCollectionView:
            return getCrewCell(collectionView, indexPath: indexPath)
        case castCollectionView:
            return getCastCell(collectionView, indexPath: indexPath)
        case similarMoviesCollectionView:
            return getMovieCell(collectionView, indexPath: indexPath)
        case reviewsCollectionView:
            return getReviewCell(collectionView, indexPath: indexPath)
        default:
            return UICollectionViewCell()
        }
        
    }
    
    func getCrewCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CreditsCollectionViewCell.identifier,
                                                            for: indexPath) as? CreditsCollectionViewCell else {fatalError(StringConstants.somethingWentWrong)}
        let crew = viewModel.credits?.crew?[indexPath.row]
        cell.crew = crew
        return cell
    }
    
    func getCastCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CreditsCollectionViewCell.identifier,
                                                            for: indexPath) as? CreditsCollectionViewCell else {fatalError(StringConstants.somethingWentWrong)}
        let cast = viewModel.credits?.cast?[indexPath.row]
        cell.cast = cast
        return cell
    }

    func getMovieCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier,
                                                            for: indexPath) as? MovieCollectionViewCell else {fatalError(StringConstants.somethingWentWrong)}
        let movie = viewModel.similarMovies?.results?[indexPath.row]
        cell.movie = movie
        return cell
    }
    
    func getReviewCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewCollectionViewCell.identifier,
                                                            for: indexPath) as? ReviewCollectionViewCell else {fatalError(StringConstants.somethingWentWrong)}
        let review = viewModel.reviews?.results?[indexPath.row]
        cell.review = review
        return cell
    }
    
    
}
