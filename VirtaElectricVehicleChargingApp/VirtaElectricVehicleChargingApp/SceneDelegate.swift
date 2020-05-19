//
//  SceneDelegate.swift
//  VirtaElectricVehicleChargingApp
//
//  Created by Naina Soni on 18/05/2020.
//  Copyright © 2020 Naina Soni. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        let defaults = UserDefaults.standard
        let authorization = defaults.string(forKey: "accessToken")
        if (authorization != nil)  {
            gotoStationList()
        }
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func gotoStationList() {
        let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "StationListViewController") as! StationListViewController
        let navController = UINavigationController(rootViewController: vc)
        navController.navigationBar.titleTextAttributes = navController.textAttributes
        navController.navigationBar.tintColor = UIColor(red: 105.0/255.0, green: 120.0/255.0, blue: 135.0/255.0, alpha: 1)
        self.window?.rootViewController = navController
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
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


extension UINavigationController {
    var textAttributes: [NSAttributedString.Key : Any]? {
        let theTextAttribute = [NSAttributedString.Key.foregroundColor:UIColor(red: 105.0/255.0, green: 120.0/255.0, blue: 135.0/255.0, alpha: 1)]
        return theTextAttribute
    }
}
