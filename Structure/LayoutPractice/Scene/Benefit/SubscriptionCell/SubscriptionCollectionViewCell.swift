//
//  SubscriptionCollectionViewCell.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/01.
//

import UIKit

class SubscriptionCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var subscriptionLabel: UILabel!
	@IBOutlet weak var contentBackgroundView: UIView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
    }
	
	override func layoutSubviews() {
		configureUI()
	}
	
	func configure(model: SubscriptionModel) {
		titleLabel.text = model.title
		subscriptionLabel.text = model.subscription
	}
	
	func configureUI() {
		contentBackgroundView.layer.cornerRadius = 14
		contentBackgroundView.layer.shadowOpacity = 0.12
		contentBackgroundView.layer.shadowColor = UIColor.black.cgColor
		contentBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 0)
	}
}
