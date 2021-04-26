//
//  StoryboardRouter.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 27/04/21.
//

import Foundation
import UIKit

public protocol StoryboardRouter {
    
    var name: String { get }
    var controller: UIViewController { get }
}

public extension StoryboardRouter {
    
    func getViewController<T>(T: UIViewController.Type) -> T? {
        guard let viewController = UIStoryboard(name: name, bundle: nil).instantiateViewController(withIdentifier: String(describing: T.self)) as? T else { return nil}
        return viewController
    }
    
    func getViewControllerWithIdentifier<T>(_ identifier: String) -> T? {
        guard let viewController = UIStoryboard(name: name, bundle: nil).instantiateViewController(withIdentifier: identifier) as? T else { return nil}
        return viewController
    }
    
    func getInitialViewController() -> UIViewController? {
        guard let viewController = UIStoryboard(name: name, bundle: nil).instantiateInitialViewController() else { return nil }
        return viewController
    }
}
