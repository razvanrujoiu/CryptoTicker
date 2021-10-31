//
//  WatchViewModel.swift
//  CryptoTicker
//
//  Created by Razvan Rujoiu on 30.10.2021.
//

import Foundation
import WatchConnectivity

class PhoneViewModel: NSObject, WCSessionDelegate {
    
    var session: WCSession
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
}
