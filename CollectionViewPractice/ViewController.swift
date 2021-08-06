//
//  ViewController.swift
//  CollectionViewPractice
//
//  Created by  60117280 on 2021/08/04.
//

import UIKit

class BankingViewCOntroller: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	lazy var globalExtensionContents: [String] = {
		var contents = [String]()
		contents.append("1번 콘텐츠")
		contents.append("2번 콘텐츠")
		contents.append("3번 콘텐츠")
		contents.append("4번 콘텐츠")
		
		return contents
	}()
	
	lazy var bankAccounts: [[Account]] = {
		var accounts = [[Account]]()
		accounts.append([
			Account(name: "신한 계좌 1", balance: "1,230,000원"),
		 	Account(name: "신한 계좌 2", balance: "5,300원"),
		 	Account(name: "신한 계좌 3", balance: "670원")
		])

		accounts.append([
			Account(name: "카카오 계좌 1", balance: "6,900,000원"),
			Account(name: "국민 계좌 2", balance: "3,300원"),
			Account(name: "하나 계좌 3", balance: "9,361,430원")
		])
		
		return accounts
	}()
	
	lazy var recommendAssets: [[Asset]] = {
		var assets = [[Asset]]()
		assets.append([
			Asset(bank: "신한은행", name: "신한더모아적금"),
			Asset(bank: "하나은행", name: "비바플래티늄체크"),
			Asset(bank: "국민은행", name: "무야호예금")
		])
		assets.append([
			Asset(bank: "쏠편한입출금통장", name: "HeyYoung"),
			Asset(bank: "(저축예금)", name: "머니박스")
		])
		
		return assets
	}()
	

	override func viewDidLoad() {
		super.viewDidLoad()
		
		configureViewType()
		setTableView()
	}
	
	private var viewType: BankingViewType = .noAccount
	
	private func configureViewType() {
		if bankAccounts.isEmpty {
			viewType = .noAccount
		} else {
			viewType = .standard
		}
	}
	
	
	
	private func setTableView() {
		tableView.delegate = self
		tableView.dataSource = self
		
		tableView.register(UINib(nibName: BankCoreCell.ID, bundle: nil), forCellReuseIdentifier: BankCoreCell.ID)
		tableView.register(UINib(nibName: NoAccountCell.ID, bundle: nil), forCellReuseIdentifier: NoAccountCell.ID)
		tableView.register(UINib(nibName: AssetRecommendationCell.ID, bundle: nil), forCellReuseIdentifier: AssetRecommendationCell.ID)
		tableView.register(UINib(nibName: SmartOfferCell.ID, bundle: nil), forCellReuseIdentifier: SmartOfferCell.ID)
		tableView.register(UINib(nibName: AssetExtensionCell.ID, bundle: nil), forCellReuseIdentifier: AssetExtensionCell.ID)
		tableView.register(UINib(nibName: GlobalExtensionListCell.ID, bundle: nil), forCellReuseIdentifier: GlobalExtensionListCell.ID)
		tableView.register(UINib(nibName: EmptyCell.ID, bundle: nil), forCellReuseIdentifier: EmptyCell.ID)
		tableView.register(UINib(nibName: CategoryHeaderView.ID, bundle: nil), forHeaderFooterViewReuseIdentifier: CategoryHeaderView.ID)

	}
}

extension BankingViewCOntroller: UITableViewDelegate, UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		if section == 0 {
			return 1
		} else {
			return 5
		}
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		if section == 0 {
			return UIView(frame: .zero)
		} else {
			let headerView = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: CategoryHeaderView.ID) as! CategoryHeaderView
			headerView.delegate = self
			headerView.configureCategories(categories: ["안녕", "나야", "잘", "지내지", "요즘", "날씨", "너무 좋지"])
			return headerView
		}
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		if section == 0 {
			return 0
		} else {
			return 50
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let emptyCell = tableView.dequeueReusableCell(withIdentifier: EmptyCell.ID, for: indexPath)
		
		if indexPath.section == 0 {
			if viewType.rawValue >= BankingViewType.standard.rawValue {
				let cell = tableView.dequeueReusableCell(withIdentifier: BankCoreCell.ID, for: indexPath) as! BankCoreCell
				cell.bind(accounts: self.bankAccounts)
				return cell
			} else {
				let cell = tableView.dequeueReusableCell(withIdentifier: NoAccountCell.ID, for: indexPath) as! NoAccountCell
				return cell
			}
		} else {
			switch indexPath.row {
			case 0:
				if viewType.rawValue >= BankingViewType.standard.rawValue {
					let cell = tableView.dequeueReusableCell(withIdentifier: AssetRecommendationCell.ID, for: indexPath) as! AssetRecommendationCell
					cell.bind(assets: self.recommendAssets)
					return cell
				} else {
					return emptyCell
				}
			case 1:
				let cell = tableView.dequeueReusableCell(withIdentifier: SmartOfferCell.ID, for: indexPath) as! SmartOfferCell
				return cell
			case 2:
				if viewType.rawValue >= BankingViewType.standard.rawValue {
					let cell = tableView.dequeueReusableCell(withIdentifier: AssetExtensionCell.ID, for: indexPath) as! AssetExtensionCell
					return cell
				} else {
					return emptyCell
				}
			case 3:
				if viewType.rawValue >= BankingViewType.standard.rawValue {
					let cell = tableView.dequeueReusableCell(withIdentifier: AssetRecommendationCell.ID, for: indexPath) as! AssetRecommendationCell
					cell.bind(assets: self.recommendAssets)
					return cell
				} else {
					return emptyCell
				}
			case 4:
				let cell = tableView.dequeueReusableCell(withIdentifier: GlobalExtensionListCell.ID, for: indexPath) as! GlobalExtensionListCell
				cell.bind(list: globalExtensionContents)
				return cell
			default:
				return emptyCell
			}
		}
	}
}

extension BankingViewCOntroller: CategoryHeaderViewDelegate {
	func selectCategory(category: String) {
		tableView.scrollToRow(at: IndexPath(row: 0, section: 1), at: .top, animated: true)
		print("\(category) 클릭")
	}
}

enum BankingViewType: Int {
	case noAccount = 0
	case standard = 1
	case pb = 2
}
