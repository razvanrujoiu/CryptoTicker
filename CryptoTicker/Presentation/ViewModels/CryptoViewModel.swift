//
//  CryptoViewModel.swift
//  CryptoTicker
//
//  Created by Razvan Rujoiu on 29.10.2021.
//

import Foundation
import Combine

class CryptoViewModel: ObservableObject {
    
    @Published public var cryptoList: CryptoList = CryptoList(data: [])
    private var service: CryptoServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(cryptoList: CryptoList = CryptoList(data: []), service: CryptoServiceProtocol = CryptoService()) {
        self.cryptoList = cryptoList
        self.service = service
    }
    
    public func onAppear() {
        self.getCryptos()
    }
    
    private func getCryptos() {
        service.getCrypto()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] cryptoList in
                self?.cryptoList = cryptoList
            }.store(in: &cancellables)

    }
}
