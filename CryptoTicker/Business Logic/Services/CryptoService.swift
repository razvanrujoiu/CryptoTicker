//
//  CryptoService.swift
//  CryptoTicker
//
//  Created by Razvan Rujoiu on 29.10.2021.
//

import Foundation
import Combine

protocol CryptoServiceProtocol: AnyObject {
    
    var networker: NetworkerProtocol { get }
    
    func getCrypto() -> AnyPublisher<CryptoList, Error>
    
}

final class CryptoService: CryptoServiceProtocol {
    let networker: NetworkerProtocol
    
    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }
    
    func getCrypto() -> AnyPublisher<CryptoList, Error> {
        let endpoint = Endpoint.cryptos
        
        return networker.get(type: CryptoList.self, url: endpoint.url, headers: endpoint.headers)
    }
}
