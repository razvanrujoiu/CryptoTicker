//
//  WatchViewModel.swift
//  CryptoTicker
//
//  Created by Razvan Rujoiu on 30.10.2021.
//

import Foundation
import WatchConnectivity

class WatchKitViewModel: NSObject, WCSessionDelegate {
    
    var session: WCSession
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        if WCSession.isSupported() {
            self.session.delegate = self
            session.activate()
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("Message from watch: ", message)
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print(activationState)
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
}
