//
//  AppDelegate.swift
//  Ulik
//
//  Created by macbook on 4/4/21.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        FirebaseApp.configure()

        self.window = UIWindow(frame: UIScreen.main.bounds)

        return true
    }
}
