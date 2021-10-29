//
//  Endpoint+CMC.swift
//  CryptoTicker
//
//  Created by Razvan Rujoiu on 29.10.2021.
//

import Foundation

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "pro-api.coinmarketcap.com"
        components.path = "/v1/cryptocurrency" + path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
    
    var headers: [String: Any] {
        return [
            "X-CMC_PRO_API_KEY": "1e56dd0b-2773-4a76-8087-153561b4f0b9"
        ]
    }
}
