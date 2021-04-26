//
//  BuildConfiguration.swift
//  BookMyShowDemo
//
//  Created by Akshay Vyavhare on 26/04/21.
//

import Foundation

public enum Plist {
    case baseUrl
    case apiKey
    func value() -> String {
        switch self {
        case .baseUrl:
            return "baseUrl"
        case .apiKey:
            return "apiKey"
        }
    }
}

public struct Environment {
    static public func configuration(_ key: Plist) -> String {
        if let infoDict = Bundle.main.infoDictionary {
            switch key {
            case .baseUrl:
                return infoDict[Plist.baseUrl.value()] as? String ?? .empty
            case .apiKey:
                return infoDict[Plist.apiKey.value()] as? String ?? .empty
            }
        } else {
            fatalError("Unable to locate plist file")
        }
    }
}
