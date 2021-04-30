//
//  MovieConfiguration.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 27/04/21.
//

import UIKit
import Alamofire

enum MovieConfiguration: APIConfiguration {
    
    case getMovies
    case getReviews(_ movieId: Int)
    case getCredits(_ movieId: Int)
    case getSimilarMovies(_ movieId: Int)
    
    var requestType: HTTPMethod {
        switch self {
        case .getMovies, .getReviews, .getCredits, .getSimilarMovies:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getMovies:
            return URLConstants.getMoviesUrl()
        case .getReviews(let movieId):
            return URLConstants.getMovieReviewsUrl(movieId: movieId)
            
        case .getCredits(let movieId):
            return URLConstants.getMovieCreditsUrl(movieId: movieId)
            
        case .getSimilarMovies(let movieId):
            return URLConstants.getSimilarMoviesUrl(movieId: movieId)
        }
    }
    
    var parameters: Parameters? {
        return nil
    }
    
    var requestHttpBody: Data? {
        return nil
    }
    
    
    
    
}
