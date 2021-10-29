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
            Text(crypto.name)
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
