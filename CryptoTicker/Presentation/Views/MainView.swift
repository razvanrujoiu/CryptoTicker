//
//  ContentView.swift
//  CryptoTicker
//
//  Created by Razvan Rujoiu on 29.10.2021.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: CryptoViewModel
    var wkViewModel = WatchKitViewModel()
    
    var body: some View {
        VStack {
            Button(action: {
                self.sendDataToWatch()
            }) {
                Text("Send message")
            }
            List(viewModel.cryptoList.data) { crypto in
                VStack(alignment: .leading) {
                    Text("\(crypto.name) (\(crypto.symbol))").font(.system(size: 20, weight: .bold))
                    Text("Price: \(String.init(format: "%.2f", crypto.price))$")
                    Text("Coinmarketcap rank: \(crypto.cmcRank)")
                    Text("Change in 1h: \(String.init(format: "%.2f",crypto.percentChange1h))%")
                        .foregroundColor(crypto.percentChange1h >= 0 ? Color.green : Color.red)
                    Text("Change in 24h: \(String.init(format:"%.2f",crypto.percentChange24h))%")
                        .foregroundColor(crypto.percentChange24h >= 0 ? Color.green : Color.red)
                    Text("Change in 7d: \(String.init(format: "%.2f", crypto.percentChange7d))%")
                        .foregroundColor(crypto.percentChange7d >= 0 ? Color.green : Color.red)
                }
            }.onAppear {
                viewModel.onAppear()
            }
        }
    }
    
    func sendDataToWatch() {
        let message =  ["cryptoList": "razvan"]
        if wkViewModel.session != nil && wkViewModel.session.isPaired && wkViewModel.session.isWatchAppInstalled && wkViewModel.session.activationState == .activated {
            if wkViewModel.session.isReachable {
                wkViewModel.session.sendMessage(message, replyHandler: nil) { error in
                    wkViewModel.session.transferUserInfo(message)
                }
            } else {
                wkViewModel.session.transferUserInfo(message)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: CryptoViewModel())
    }
}
