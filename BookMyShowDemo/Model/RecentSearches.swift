//
//  RecentSearches.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 30/04/21.
//

import Foundation
import UIKit

class RecentSearches: NSObject, NSCoding, Codable {
    
    var movieName: String?
    var releaseDate: String?
    var id: Int?
    var image: String?
    
    init(json: Results)
    {
        self.id = json.id
        self.movieName = json.title
        self.releaseDate = json.releaseDate
        self.image = json.posterPath
    }
    
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.movieName, forKey: "title")
        aCoder.encode(self.releaseDate, forKey: "releaseDate")
        aCoder.encode(self.image,forKey: "posterPath")
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        self.id = aDecoder.decodeObject(forKey: "id") as? Int
        self.movieName = aDecoder.decodeObject(forKey: "title") as? String
        self.releaseDate = aDecoder.decodeObject(forKey: "releaseDate") as? String
        self.image = aDecoder.decodeObject(forKey: "posterPath") as? String
    }
    
}
