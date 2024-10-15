//
//  EndPoints.swift
//  SwiftUI-CurrentConverter
//
//  Created by sreekanth Pulicherla on 15/10/24.
//

import Foundation

import Foundation

enum Endpoint {
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
            return ["access_key": "lj861wYt4ahALxKgch7tRZ1lPnpHktVi"]
            
        case .withSymbols:
            return [
                "symbols" : "GBP,JPY,USD,INR",
                "access_key": "lj861wYt4ahALxKgch7tRZ1lPnpHktVi"
            ]
        }
    }
}
