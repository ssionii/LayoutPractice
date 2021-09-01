//
//  AppDelegate.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/08/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	// SOL의 AppDelegate.navigationController
	var navigationController = UINavigationController()
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = MainViewController()
//		navigationController.pushViewController(MainViewController(nibName: "MainViewController", bundle: nil), animated: false)
		window?.makeKeyAndVisible()
		
		return true
	}
}

