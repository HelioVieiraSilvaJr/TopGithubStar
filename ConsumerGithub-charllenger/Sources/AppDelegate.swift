//
//  AppDelegate.swift
//  ConsumerGithub-charllenger
//
//  Created by Helio Junior on 16/09/20.
//  Copyright © 2020 HelioTecnologia. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = ListReposViewController().instantiate() as! ListReposViewController
        let navController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }

}

