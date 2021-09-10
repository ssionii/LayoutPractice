//
//  MenuCell.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/08/30.
//

import UIKit

class MenuCell: UICollectionViewCell {
	
	static let ID = "MenuCell"

	@IBOutlet weak var titleView: UIView!
	@IBOutlet weak var titleLabel: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
		
		titleView.layer.cornerRadius = 12
		titleView.layer.masksToBounds = false
    }

	func bind(text: String, color: UIColor) {
		titleLabel.text = text
		titleView.backgroundColor = color.withAlphaComponent(0.1)
		titleLabel.textColor = color
	}
}
