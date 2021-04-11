//
//  SceneDelegate.swift
//  Ulik
//
//  Created by macbook on 4/4/21.
//
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(frame: scene.coordinateSpace.bounds)
        window.windowScene = scene
        window.rootViewController = UAMainTabBarController()

        self.window = window

        window.makeKeyAndVisible()
    }
}
