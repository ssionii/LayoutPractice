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
		let tableView = SelfSizingTableView(frame: .zero, style: .grouped)
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
	private let sectionControllerFactory = BankingSectionFactory()
	
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
		let myMenuIndex = viewModel.sections.firstIndex { $0 is MyMenuViewModel }
		myMenuCellRect = tableView.rectForRow(at: IndexPath(row: 0, section: myMenuIndex ?? 1))
	}
	
	private func configureTableVIew() {
		
		sectionControllerFactory.registerCells(on: tableView)
		
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
		return viewModel.sections[section].sectionViewModel.rowCount
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		if let headerView = viewModel.sections[section].sectionViewModel.headerViewModel {
			return headerView.headerHeight
		} else {
			return 0
		}
	}
	
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		if let footerView = viewModel.sections[section].sectionViewModel.footerViewModel {
			return footerView.footerHeight
		} else {
			return 0
		}
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		guard let sectionController = sectionControllerFactory.sectionController(with: viewModel.sections[section]) else {
			print("section controller 구현 필요: \(viewModel.sections[section].type)")
			return UITableViewCell()
		}
		
		return sectionController.headerView()
	}
	
	func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		guard let sectionController = sectionControllerFactory.sectionController(with: viewModel.sections[section]) else {
			print("section controller 구현 필요: \(viewModel.sections[section].type)")
			return UITableViewCell()
		}
		
		return sectionController.footerView()
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		guard let sectionController = sectionControllerFactory.sectionController(with: viewModel.sections[indexPath.section]) else {
			print("section controller 구현 필요: \(viewModel.sections[indexPath.section].type)")
			return UITableViewCell()
		}
		return sectionController.cellFromReusableCellHolder(tableView, forIndexPath: indexPath)
	}
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		if !smartOfferIsShown {
			guard let myMenuCellRect = myMenuCellRect else { return }
			let rectOfCellInSuperView = tableView.convert(myMenuCellRect, to: tableView.superview)

			if rectOfCellInSuperView.origin.y < tableView.frame.origin.y {
				
				viewModel.insertSmartOffer()

				tableView.beginUpdates()
				tableView.insertSections(IndexSet(integer: viewModel.sections.firstIndex(where: { $0 is SmartOfferSection }) ?? 0), with: .fade)
				tableView.endUpdates()
				smartOfferIsShown = true
			}
		}
	}

	
	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
		
	}
	
	func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
	}
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		
		
//		let animation = AnimationFactory.makeMoveUpWithBounce(rowHeight: cell.frame.height, duration: 1.0, delayFactor: 0.1)
//		let animator = Animator(animation: animation)
//		animator.animate(cell: cell, at: indexPath, in: tableView)
	}
}
