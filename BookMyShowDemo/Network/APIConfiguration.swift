//
//  APIConfiguration.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 26/04/21.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {

    var requestType: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var requestHttpBody: Data? {get}
}

extension APIConfiguration {

    func asURLRequest() throws -> URLRequest {
        let baseURL = URLConstants.baseURL
        let url =  String(format: "%@%@", baseURL, path)
        let urlwithPercent = url.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
        var urlRequest = URLRequest(url: URL(string: urlwithPercent!)!)

        // Http method
        urlRequest.httpMethod = requestType.rawValue

        // common headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)

        urlRequest.timeoutInterval  = 120
        
        if requestHttpBody != nil {
            urlRequest.httpBody = requestHttpBody
        } else if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
}

