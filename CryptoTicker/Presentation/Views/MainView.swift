//
//  ContentView.swift
//  CryptoTicker
//
//  Created by Razvan Rujoiu on 29.10.2021.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: CryptoViewModel
    
    var body: some View {
        List(viewModel.cryptoList.data) { crypto in
            VStack {
                Text(crypto.name)
                Text(crypto.symbol)
                Text("Price: \(crypto.price)")
                Text("Coinmarketcap rank: \(crypto.cmcRank)")
                Text("Change in 1h: \(crypto.percentChange1h)%")
                    .foregroundColor(crypto.percentChange1h >= 0 ? Color.green : Color.red)
                Text("Change in 24h: \(crypto.percentChange24h)%")
                    .foregroundColor(crypto.percentChange24h >= 0 ? Color.green : Color.red)
                Text("Change in 7d: \(crypto.percentChange7d)%")
                    .foregroundColor(crypto.percentChange7d >= 0 ? Color.green : Color.red)
            }
        }.onAppear {
            viewModel.onAppear()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: CryptoViewModel())
    }
}
