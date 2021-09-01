//
//  MainViewController.swift
//  CollectionViewPractice
//
//  Created by  60117280 on 2021/08/06.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		let standarVC = BankingViewController()
		
		standarVC.tabBarItem = UITabBarItem(title: "standard", image: UIImage(named: "home"), tag: 0)
		
		let noneVC = BankingViewController()
		noneVC.tabBarItem = UITabBarItem(title: "none", image: UIImage(named: "star"), tag: 1)
		
		self.viewControllers = [standarVC, noneVC]
	}

}
