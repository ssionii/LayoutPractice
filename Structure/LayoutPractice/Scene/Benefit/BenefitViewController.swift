//
//  BenefitViewController.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/08/30.
//

import UIKit

class BenefitViewController: UIViewController {
	
	@IBOutlet weak var headerView: UIView!
	
	private lazy var tableView: SelfSizingTableView = {
		let tableView = SelfSizingTableView()
		tableView.delegate = self
		tableView.dataSource = self
		tableView.allowsSelection = false
		tableView.separatorStyle = .none
		tableView.rowHeight = UITableView.automaticDimension
		tableView.showsVerticalScrollIndicator = false
		tableView.backgroundColor = .clear
		
		return tableView
	}()
	
	private let viewModel = BenefitViewModel()

	init() {
		super.init(nibName: "BenefitViewController", bundle: nil)
		
		self.title = "혜택"
		self.tabBarItem = UITabBarItem(title: "혜택", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.view.backgroundColor = .systemGray6
		configureTableView()
	
    }
	
	private func configureTableView() {
		for section in viewModel.sections {
			tableView.register(UINib(nibName: section.cellID, bundle: nil), forCellReuseIdentifier: section.cellID)
		}
		
		tableView.register(UINib(nibName: BenefitHeaderView.reuseIdentifier, bundle: nil), forHeaderFooterViewReuseIdentifier: BenefitHeaderView.reuseIdentifier)
		
		view.addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
		tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		tableView.contentInset = .init(top: 0, left: 0, bottom: 0, right: 0)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}


extension BenefitViewController: UITableViewDelegate {
	
}

extension BenefitViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return viewModel.sections.count
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let section = viewModel.sections[section]
		guard let headerViewID = section.headerViewID,
			  let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerViewID) as? MainHeaderView,
			  let headerContent = section.headerContent else {
			return UIView()
		}
		headerView.configure(content: headerContent)
		return headerView
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let section = viewModel.sections[indexPath.section]
		guard let cell = tableView.dequeueReusableCell(withIdentifier: section.cellID, for: indexPath) as? MainTableViewCell else {
			return UITableViewCell()
		}
		cell.configure(content: section.content)
		return cell
	}
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//		let animation = AnimationFactory.makeMoveUpWithBounce(rowHeight: cell.frame.height, duration: 2.0, delayFactor: 0.1)
//		let animator = Animator(animation: animation)
//		animator.animate(cell: cell, at: indexPath, in: tableView)
	}
}

