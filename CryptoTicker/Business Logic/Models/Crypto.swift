//
//  Crypto.swift
//  CryptoTicker
//
//  Created by Razvan Rujoiu on 29.10.2021.
//

import Foundation

struct Crypto: Codable, Identifiable {
    let id: String
    let name: String
    let symbol: String
    let cmcRank: String?
    let price: Double?
    let percentChange1h: Double?
    let percentChange24h: Double?
    let percentChange7d: Double?
}
