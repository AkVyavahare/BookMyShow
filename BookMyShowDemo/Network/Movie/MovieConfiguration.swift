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
    
    var requestType: HTTPMethod {
        switch self {
        case .getMovies:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getMovies:
            return URLConstants.getMoviesUrl()
        }
    }
    
    var parameters: Parameters? {
        return nil
    }
    
    var requestHttpBody: Data? {
        return nil
    }
    
    
    
    
}
