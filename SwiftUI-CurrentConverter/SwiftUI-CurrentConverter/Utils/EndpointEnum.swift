//
//  EndpointEnum.swift
//  SwiftUI-CurrentConverter
//
//  Created by sreekanth Pulicherla on 15/10/24.
//

import Foundation

enum Endpoints {
    case `default`
    case withSymbols
    
    private var baseURL: URL {
        URL(string: "https://api.exchangeratesapi.io/v1/latest")!
    }
    
    var url: URL? {
        baseURL.setQueries(query())
    }
    
    func query() -> [String: String] {
        switch self {
        case .default:
            return ["access_key": "28f72da1d1cc2688292c7c3b634b508b"]
            
        case .withSymbols:
            return [
                "symbols" : "GBP,JPY,USD,INR",
                "access_key": "28f72da1d1cc2688292c7c3b634b508b"
            ]
        }
    }
}
