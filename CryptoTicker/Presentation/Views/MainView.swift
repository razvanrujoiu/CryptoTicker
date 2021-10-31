//
//  ContentView.swift
//  CryptoTicker
//
//  Created by Razvan Rujoiu on 29.10.2021.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: CryptoViewModel
    var phoneViewModel = PhoneViewModel()
    
    @State var isWatchReachable = "No"
    
    var body: some View {
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
            self.phoneViewModel.session.sendMessage(["cryptoList" : viewModel.cryptoList], replyHandler: nil) { error in
                print(error.localizedDescription)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: CryptoViewModel())
    }
}
