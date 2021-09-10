//
//  AssetCardHeaderView.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/09.
//

import UIKit

class AssetCardHeaderView: UICollectionReusableView {

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var contentBackgroundView: UIView!
	
    override func awakeFromNib() {
        super.awakeFromNib()
    }
	
	override func layoutSubviews() {
		contentBackgroundView.backgroundColor = .yellow
	}
	
	func bind(model: AssetCardHeaderModel) {
		self.titleLabel.text = model.title
	}
    
}
