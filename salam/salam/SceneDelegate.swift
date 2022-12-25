//
//  SceneDelegate.swift
//  salam
//
//  Created by user229516 on 11/5/22.
//

import UIKit

//extension UITabBar {
//    override open func sizeThatFits(_ size: CGSize) -> CGSize {
//        super.sizeThatFits(size)
//
//        var sizeThatFits = super.sizeThatFits(size)
//
//        sizeThatFits.height = sizeThatFits.height + 100
//
//        return sizeThatFits
//    }
//}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        
        if let windowScene = scene as? UIWindowScene{
            
            let window = UIWindow(windowScene: windowScene)
            //SettingsViewController
            
            self.window = window
            window.rootViewController = SignInAssembly.assembly()
            window.backgroundColor = .white
            window.makeKeyAndVisible()            
        }
        
        /*if let windowScene2 = scene as? UIWindowScene {
            window?.windowScene = windowScene2
            window?.makeKeyAndVisible()
            let controller = ViewController()
            let navController = UINavigationController(rootViewController: controller)
            window?.rootViewController = navController
        }*/
        
        /*guard let windowScene2 = (scene as? UIWindowScene) else { return }
        window?.windowScene = windowScene2
        window?.makeKeyAndVisible()
        let controller = ViewController()
        let navController = UINavigationController(rootViewController: controller)
        window?.rootViewController = navController*/
        
        //guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

