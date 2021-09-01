//
//  MainViewController.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/08/30.
//

import UIKit

class MainViewController: UITabBarController {

	init() {
		super.init(nibName: "MainViewController", bundle: nil)
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		configureTabController()
	}
	
	private func configureTabController() {
		
		let bankingVC = BankingViewController()
		let benefitVC = BenefitViewController()
		
		self.viewControllers = [bankingVC, benefitVC]
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
