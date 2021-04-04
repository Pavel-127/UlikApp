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

        window.rootViewController = UINavigationController(rootViewController: UAInitViewController())

        self.window = window

        self.setupNavBarApperance()

        window.makeKeyAndVisible()
    }

    func setupNavBarApperance() {
        UINavigationBar.appearance().backgroundColor = .lightGray
    }

    func changeRootViewController(_ vc: UIViewController, animated: Bool = false) {
        guard let window = self.window else { return }

        window.rootViewController = vc
    }
}
