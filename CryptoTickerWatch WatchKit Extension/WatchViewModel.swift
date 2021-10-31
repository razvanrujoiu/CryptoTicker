//
//  WatchViewModel.swift
//  CryptoTickerWatch WatchKit Extension
//
//  Created by Razvan Rujoiu on 30.10.2021.
//

import Foundation
import WatchConnectivity

class WatchViewModel: NSObject, WCSessionDelegate, ObservableObject {
    var session: WCSession
    @Published var cryptoList: CryptoList? = nil
    init(session: WCSession = .default) {
        self.session = session
        session.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            self.cryptoList = message["cryptoList"] as? CryptoList
        }
    }
}
