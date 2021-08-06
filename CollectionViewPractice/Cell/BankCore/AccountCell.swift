//
//  AccountCollectionViewCell.swift
//  CollectionViewPractice
//
//  Created by  60117280 on 2021/08/05.
//

import UIKit

class AccountCell: UICollectionViewCell {
	
	static let ID = "AccountCell"
	
	@IBOutlet weak var backgroundUIView: UIView!
	@IBOutlet weak var accountName: UILabel!
	@IBOutlet weak var accountBalance: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
		configureUI()
    }
	
	func bind(name: String, balance: String) {
		self.accountName.text = name
		self.accountBalance.text = balance
	}
	
	private func configureUI() {
		self.backgroundUIView.layer.cornerRadius = 10.0
	}
}
