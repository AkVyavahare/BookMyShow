//
//  Extensions.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 26/04/21.
//

import UIKit

extension String {
    static var empty: String {
        return  ""
    }
}

public extension UICollectionViewCell {

    @objc class var identifier: String {
        return String(describing: self)
    }
}
