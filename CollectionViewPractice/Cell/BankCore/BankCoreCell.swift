//
//  BankCoreTableViewCell.swift
//  CollectionViewPractice
//
//  Created by  60117280 on 2021/08/05.
//

import UIKit

class BankCoreCell: UITableViewCell {
	
	static let ID = "BankCoreCell"
	
	@IBOutlet weak var accountCollectionView: UICollectionView!
	
	@IBAction func shinhanBankButtonClicked(_ sender: Any) {
		isShinhanBank = true
		accountCollectionView.reloadData()
	}
	@IBAction func otherBankButtonClicked(_ sender: Any) {
		isShinhanBank = false
		accountCollectionView.reloadData()
	}
	
	var accounts = [[Account]]()
	var isShinhanBank = true
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		// 이게 여기에 있는게 맞나?
		setCollectionView()
	}
	
	private func setCollectionView() {
		self.accountCollectionView.delegate = self
		self.accountCollectionView.dataSource = self
		
		accountCollectionView.register(UINib(nibName: AccountCell.ID, bundle: nil), forCellWithReuseIdentifier: AccountCell.ID)

	}
	
	func bind(accounts: [[Account]]) {
		self.accounts = accounts
//		accountCollectionView.reloadData()
	}
}

extension BankCoreCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		var accountIndex = 0
		if !isShinhanBank { accountIndex = 1 }
		
		return accounts[accountIndex].count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		// 여기 포스 언래핑 빼고 싶다.
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AccountCell.ID, for: indexPath) as! AccountCell
		
		var accountIndex = 0
		if !isShinhanBank { accountIndex = 1 }
		
		cell.bind(name: accounts[accountIndex][indexPath.row].name, balance: accounts[accountIndex][indexPath.row].balance)
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
	}
}
