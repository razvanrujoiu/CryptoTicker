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
    @Published var fromUserInfoTransfer: String = ""
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        if WCSession.isSupported() {
            self.session.delegate = self
            session.activate()
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        if let message = userInfo["cryptoList"] as? String {
            DispatchQueue.main.async {
                self.fromUserInfoTransfer = message
            }
        }
    }
    
    func session(_ session: WCSession, didFinish userInfoTransfer: WCSessionUserInfoTransfer, error: Error?) {
        
    }
    
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {        
        if let message = message["cryptoList"] as? String {
            DispatchQueue.main.async {
                self.fromUserInfoTransfer = message
            }
        }
    }
}
