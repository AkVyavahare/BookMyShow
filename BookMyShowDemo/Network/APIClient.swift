//
//  APIClient.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 26/04/21.
//

import Foundation
import Alamofire

protocol APIClient {
    func performRequest<T: Decodable>(config: APIConfiguration, decode: @escaping (Decodable) -> T?, completion: @escaping  (Result<T, ErrorResponse>) -> Void)
}

extension APIClient {
    typealias CompletionHandler = (Decodable?, ErrorResponse?) -> Void
    
    func decodingTask<T: Decodable>(with config: URLRequest, decodingType: T.Type, completionHandler completion: @escaping  CompletionHandler) {
        
        AF.request(config)
            .responseJSON { (response) in
                switch response.result {
                case .success:
                    do {
                        if let data = response.data {
                            let dataModel = try JSONDecoder().decode(decodingType, from: data)
                            completion(dataModel, nil)
                        }
                    }
                    catch {
                        completion(nil, self.generateErroModel())
                    }
                    
                case .failure :
                    do {
                        
                        if let data = response.data {
                            let errors = try JSONDecoder().decode([String: [String: [ErrorResponse]]].self, from: data)
                            guard let error = errors.values.first?.values.first else {
                                completion(nil, self.generateErroModel())
                                return
                            }
                            completion(nil, error[0])
                            
                        } else {
                            
                            completion(nil, self.generateErroModel())
                        }
                        
                    } catch {
                        completion(nil, self.generateErroModel())
                    }
                }
            }
    }
    
    func performRequest<T: Decodable>(config: APIConfiguration, decode: @escaping (Decodable) -> T?, completion: @escaping  (Result<T, ErrorResponse>) -> Void) {
        do {
            try decodingTask(with: config.asURLRequest(), decodingType: T.self) { (json, error) in
                
                DispatchQueue.main.async {
                    guard let json = json else {
                        if let error = error {
                            completion(Result.failure(error))
                        } else {
                            completion(Result.failure(self.generateErroModel()!))
                        }
                        return
                    }
                    if let value = decode(json) {
                        completion(.success(value))
                    } else {
                        completion(Result.failure(self.generateErroModel()!))
                    }
                }
            }
        } catch {
            completion(Result.failure(self.generateErroModel()!))
        }
    }
    func generateErroModel(_ noInternet: Bool = false) -> ErrorResponse? {
        return ErrorResponse(messageCode: .empty , message: StringConstants.somethingWentWrong)
    }
    
}
