//
//  Constants.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 26/04/21.
//

import Foundation

struct StringConstants {
    static let somethingWentWrong = "Something went wrong"
    static let apiKey = "aba90403debfd81a92233609f5598667"
    static let book = "Book"
    static let movies = "Movies"
    static let recentlySearched = "Recently Searched"
    static let searchMovies = "Search Movies"
    static let synopsis = "Synopsis:"
    static let cast = "Cast"
    static let crew = "Crew"
}

struct URLConstants {
    static let baseURL = "https://api.themoviedb.org/3/"
    static func getMoviesUrl() -> String {
        return "movie/now_playing?api_key=\(StringConstants.apiKey)"
        
    }
    static func getSimilarMoviesUrl(movieId: Int) -> String {
        return "movie/\(movieId)/similar?api_key=\(StringConstants.apiKey)&language=en-US"
    }
    
    static func getMovieCreditsUrl(movieId: Int) -> String {
        return "movie/\(movieId)/credits?api_key=\(StringConstants.apiKey)"
    }
    
    static func getMovieReviewsUrl(movieId: Int) -> String {
        return "movie/\(movieId)/reviews?api_key=\(StringConstants.apiKey)"
    }
    
    static func imageURL(imageName: String) -> String {
        return "https://image.tmdb.org/t/p/w500/\(imageName)"
    }
}
