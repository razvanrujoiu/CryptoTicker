//
//  CryptoListViewConfigurator.swift
//  CryptoTicker
//
//  Created by Razvan Rujoiu on 29.10.2021.
//

import Foundation

final class CryptoListViewConfigurator {
    public static func configureCryptoListView(with viewModel: CryptoViewModel = CryptoViewModel()) -> MainView {
        let mainView = MainView(viewModel: viewModel)
        return mainView
    }
    
}
