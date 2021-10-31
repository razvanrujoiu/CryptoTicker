//
//  CryptoTickerApp.swift
//  CryptoTickerWatch WatchKit Extension
//
//  Created by Razvan Rujoiu on 30.10.2021.
//

import SwiftUI

@main
struct CryptoTickerApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
