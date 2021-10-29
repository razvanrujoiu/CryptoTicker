//
//  Crypto.swift
//  CryptoTicker
//
//  Created by Razvan Rujoiu on 29.10.2021.
//

import Foundation

fileprivate struct RawServerResponse: Decodable {
    
    let id: Int
    let name: String
    let symbol: String
    let cmc_rank: Int
    let quote: Quote
    
    struct Quote: Decodable {
        let USD: Usd
    }
    
    struct Usd: Decodable {
        let price: Double
        let percent_change_1h: Double
        let percent_change_24h: Double
        let percent_change_7d: Double
    }
    
}

struct Crypto: Codable, Identifiable {
    let id: Int
    let name: String
    let symbol: String
    let cmcRank: Int
    let price: Double
    let percentChange1h: Double
    let percentChange24h: Double
    let percentChange7d: Double
    
    init(from decoder: Decoder) throws {
        let rawResponse = try RawServerResponse(from: decoder)
        id = rawResponse.id
        name = rawResponse.name
        symbol = rawResponse.symbol
        cmcRank = rawResponse.cmc_rank
        price = rawResponse.quote.USD.price
        percentChange1h = rawResponse.quote.USD.percent_change_1h
        percentChange7d = rawResponse.quote.USD.percent_change_7d
        percentChange24h = rawResponse.quote.USD.percent_change_24h
    }
}
