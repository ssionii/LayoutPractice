//
//  GlobalExtensionCell.swift
//  CollectionViewPractice
//
//  Created by  60117280 on 2021/08/05.
//

import UIKit

class GlobalExtensionCell: UICollectionViewCell {

	static let ID = "GlobalExtensionCell"
	
	@IBOutlet weak var label: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
    }
	
	func bind(text: String) {
		self.label.text = text
	}

}
