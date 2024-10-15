//
//  ExchangeRateService.swift
//  SwiftUI-CurrentConverter
//
//  Created by sreekanth Pulicherla on 15/10/24.
//

import Foundation
import Combine

final class ExchangeRateService {
    static let shared = ExchangeRateService()
    
    func getExchangeRate() -> AnyPublisher<ExchangeRate, Error> {
        return urlSession(ExchangeRate.self, with: Endpoints.withSymbols.url!)
    }
    
    func urlSession<T: Codable>(_ type: T.Type, with url: URL) -> AnyPublisher<T, Error> {
        URLSession
            .shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: type.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .print()
            .eraseToAnyPublisher()
    }
}
