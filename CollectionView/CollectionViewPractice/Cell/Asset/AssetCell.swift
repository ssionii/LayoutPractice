//
//  AssetCollectionViewCell.swift
//  CollectionViewPractice
//
//  Created by  60117280 on 2021/08/05.
//

import UIKit

class AssetCell: UICollectionViewCell {
	
	static let ID = "AssetCell"
	
	@IBOutlet weak var bankLabel: UILabel!
	@IBOutlet weak var nameLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	func bind(bank: String, name: String) {
		self.bankLabel.text = bank
		self.nameLabel.text = name
	}
}
