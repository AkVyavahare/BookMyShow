//
//  ErrorResponse.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 26/04/21.
//

import Foundation

struct ErrorResponse: Decodable, Error {
    var messageCode: String, message: String
}
