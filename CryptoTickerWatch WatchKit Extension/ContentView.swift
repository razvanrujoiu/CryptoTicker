//
//  ContentView.swift
//  CryptoTickerWatch WatchKit Extension
//
//  Created by Razvan Rujoiu on 30.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var watchViewModel = WatchViewModel()
    
    var body: some View {
        List(watchViewModel.cryptoList!.data) { crypto in
            VStack {
                Text(crypto.name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
