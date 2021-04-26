//
//  NetworkConstants.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 27/04/21.
//

import Foundation

enum ContentType: String {
    case json = "application/json"
    case multipart = "multipart/form-data"
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case acceptLangauge = "Accept-Language"
}
