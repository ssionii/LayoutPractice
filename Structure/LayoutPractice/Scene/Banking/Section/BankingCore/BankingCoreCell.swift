//
//  AccountCell.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/08/30.
//

import UIKit

class BankingCoreCell: UITableViewCell {
	
	@IBOutlet weak var collectionView: UICollectionView!
	@IBAction func ourBankClicked(_ sender: Any) {
		isOurBankClicked = true
	}
	
	@IBAction func otherBankClicked(_ sender: Any) {
		isOurBankClicked = false
	}
	
	var displayedAccounts: [Account]? {
		didSet {
			collectionView.reloadData()
		}
	}
	
	private var isOurBankClicked: Bool = true {
		didSet {
			if isOurBankClicked {
				displayedAccounts = viewModel?.ourBankAccounts
			} else {
				displayedAccounts = viewModel?.otherBankAccounts
			}
		}
	}
	
	private var cellWidth: CGFloat?
	
	private var viewModel: BankingCoreViewModel?
	
	override func awakeFromNib() {
        super.awakeFromNib()
    }
	
	override func layoutSubviews() {
		configureCollectionView()
	}
	
	func bind(viewModel: BankingCoreViewModel) {
		self.viewModel = viewModel
		
		displayedAccounts = viewModel.ourBankAccounts
	}

	private func configureCollectionView() {
		collectionView.delegate = self
		collectionView.dataSource = self
		
		collectionView.register(UINib(nibName: AccountCardCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: AccountCardCell.reuseIdentifier)
		
		cellWidth = self.contentView.frame.width - (horizontalMarginInMain * 2)
		collectionView.contentInset = UIEdgeInsets(top: 0, left: horizontalMarginInMain, bottom: 0, right: horizontalMarginInMain)
	}
}

extension BankingCoreCell: UICollectionViewDelegate {
	
}

extension BankingCoreCell: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return displayedAccounts?.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AccountCardCell.reuseIdentifier, for: indexPath) as? AccountCardCell,
			  let account = displayedAccounts?[indexPath.row] else {
			return UICollectionViewCell()
		}
		cell.delegate = self
		cell.configure(account: account)
		return cell
	}
}

extension BankingCoreCell: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: cellWidth!, height: collectionView.frame.height)
	}
}

extension BankingCoreCell: AccountCardCellDelegate {
	func transferButtonClicked() {
		self.viewModel?.delegate?.transferButtonClicked()
	}
}
