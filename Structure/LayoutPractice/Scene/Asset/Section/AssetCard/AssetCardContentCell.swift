//
//  AssetCardContentCell.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/09.
//

import UIKit

class AssetCardContentCell: UICollectionViewCell {

	@IBOutlet weak var contentBackgroundView: UIView!
	@IBOutlet weak var titleLabel: UILabel!
	
	var isHeightCalculated: Bool = false
	
	override func awakeFromNib() {
        super.awakeFromNib()
    }
	
	override func layoutSubviews() {
		contentBackgroundView.backgroundColor = .green
		
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
	}
	
	override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
		if !isHeightCalculated {
			setNeedsLayout()
			layoutIfNeeded()
			let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
			var newFrame = layoutAttributes.frame
			newFrame.size.width = CGFloat(ceilf(Float(size.width)))
			layoutAttributes.frame = newFrame
			isHeightCalculated = true
		}
		return layoutAttributes
	}
	
	func bind(model: AssetCardRowModel) {
		self.titleLabel.text = model.title
	}
}
