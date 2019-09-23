//
//  AppDelegate.swift
//  Battleground
//
//  Created by Stas Kirichok on 16-05-2019.
//  Copyright © 2019 Stas Kirichok. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        presentInitialScreen()
        return true
    }

    private func presentInitialScreen() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        WindowCoordinator(window: window).makeFlow()
    }

}

