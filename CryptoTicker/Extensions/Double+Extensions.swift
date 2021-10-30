//
//  Double+Extensions.swift
//  CryptoTicker
//
//  Created by Razvan Rujoiu on 30.10.2021.
//

import Foundation

extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
