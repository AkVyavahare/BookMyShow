//
//  UITableViewExtension.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 27/04/21.
//

import UIKit

public extension UITableView {
    func register(_ type: UITableViewCell.Type) {
        let className =  String(describing: type)
        register(UINib(nibName: className, bundle: nil), forCellReuseIdentifier: className)
    }
    
    func dequeReusableCell<T>(_ type: T.Type) -> T? {
        let className =  String(describing: type)
        return dequeueReusableCell(withIdentifier: className) as? T
    }
}
