//
//  MovieStoryboard.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 27/04/21.
//

import Foundation
import UIKit

enum MovieStoryboard: StoryboardRouter {
    case initial
    case detail
    
    var name: String {
        return "Movie"
    }
    
    var controller: UIViewController {
        switch self {
        case .initial: return self.getInitialViewController()!
        case .detail: return self.getViewController(T: MovieDetailsViewController.self)!
        }
    }
}
