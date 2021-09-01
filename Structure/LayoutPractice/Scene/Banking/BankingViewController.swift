//
//  BankingViewController.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/08/30.
//

import UIKit

class BankingViewController: UIViewController {
	
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
	
	private let viewModel = BankingViewModel()

	private var myMenuCellRect: CGRect?
	private var smartOfferIsShown = false
	
	init() {
		super.init(nibName: "BankingViewController", bundle: nil)
		
		self.title = "뱅킹"
		self.tabBarItem = UITabBarItem(title: "뱅킹", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.view.backgroundColor = .systemGray6
		configureTableVIew()
		
    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		// myMenu 감지
		let myMenuIndex = viewModel.sections.firstIndex { $0 is MyMenuSection }
		myMenuCellRect = tableView.rectForRow(at: IndexPath(row: 0, section: myMenuIndex ?? 1))
	}
	
	private func configureTableVIew() {
		
		for section in viewModel.sections {
			tableView.register(UINib(nibName: section.cellID, bundle: nil), forCellReuseIdentifier: section.cellID)
		}
		
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

extension BankingViewController: UITableViewDelegate {
	
}

extension BankingViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return viewModel.sections.count
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
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		if !smartOfferIsShown {
			guard let myMenuCellRect = myMenuCellRect else { return }
			let rectOfCellInSuperView = tableView.convert(myMenuCellRect, to: tableView.superview)
			
			if rectOfCellInSuperView.origin.y < tableView.frame.origin.y {
				let registerCellID = viewModel.insertSmartOffer()
				// 여기서 register를 하는게 맞나?
				tableView.register(UINib(nibName: registerCellID, bundle: nil), forCellReuseIdentifier: registerCellID)
				tableView.beginUpdates()
				tableView.insertSections(IndexSet(integer: viewModel.sections.firstIndex(where: { $0 is SmartOfferSection }) ?? 0), with: .fade)
				tableView.endUpdates()
				smartOfferIsShown = true
			}
		}
	}
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//		let animation = AnimationFactory.makeMoveUpWithBounce(rowHeight: cell.frame.height, duration: 1.0, delayFactor: 0.1)
//		let animator = Animator(animation: animation)
//		animator.animate(cell: cell, at: indexPath, in: tableView)
	}
}
