//
//  MovieRouter.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 27/04/21.
//

import Foundation
class MovieRouter: APIClient {
    
    func getMovies(config: MovieConfiguration, completion: @escaping (Result<MovieList?, ErrorResponse>) -> Void) {
        performRequest(config: config, decode: { (json) -> MovieList? in
            guard let data = json as? MovieList else { return  nil }
            return data
        }, completion: completion)
    }
    
    func getMovieReviews(config: MovieConfiguration, completion: @escaping (Result<ReviewsData?, ErrorResponse>) -> Void) {
        performRequest(config: config, decode: { (json) -> ReviewsData? in
            guard let data = json as? ReviewsData else { return  nil }
            return data
        }, completion: completion)
    }
    
    func getMovieCredits(config: MovieConfiguration, completion: @escaping (Result<Credits?, ErrorResponse>) -> Void) {
        performRequest(config: config, decode: { (json) -> Credits? in
            guard let data = json as? Credits else { return  nil }
            return data
        }, completion: completion)
    }
    
    func getSimilarMovies(config: MovieConfiguration, completion: @escaping (Result<SimilarMovies?, ErrorResponse>) -> Void) {
        performRequest(config: config, decode: { (json) -> SimilarMovies? in
            guard let data = json as? SimilarMovies else { return  nil }
            return data
        }, completion: completion)
    }
}
