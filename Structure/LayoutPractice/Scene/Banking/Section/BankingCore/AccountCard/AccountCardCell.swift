//
//  AccountCardCell.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/08/31.
//

import UIKit

protocol AccountCardCellDelegate: class {
	func transferButtonClicked()
}

class AccountCardCell: UICollectionViewCell {

	@IBOutlet weak var accountNameLabel: UILabel!
	@IBOutlet weak var accountNumberLabel: UILabel!
	@IBOutlet weak var balanceLabel: UILabel!
	@IBOutlet weak var contentBackgroundView: UIView!
	
	@IBAction func accountButtonClicked(_ sender: Any) {
		delegate?.transferButtonClicked()
	}
	
	weak var delegate: AccountCardCellDelegate?
	
    override func awakeFromNib() {
        super.awakeFromNib()
    }
	
	func configure(account: Account) {
		accountNameLabel.text = account.name
		accountNumberLabel.text = account.accountNumber
		balanceLabel.text = account.balance
	}
	
}
