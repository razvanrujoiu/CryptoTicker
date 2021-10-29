//
//  Endpoint+CMC.swift
//  CryptoTicker
//
//  Created by Razvan Rujoiu on 29.10.2021.
//

import Foundation

extension Endpoint {
    
    static var cryptos: Self {
        return Endpoint(path: "/listings/latest")
    }
}
