//
//  ErrorResponse.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 26/04/21.
//

import Foundation

struct ErrorResponse: Decodable, Error {
    let statusMessage: String?
    let success: Bool?
    let statusCode: Int?

    enum CodingKeys: String, CodingKey {
        case statusMessage = "status_message"
        case success
        case statusCode = "status_code"
    }
}
