//
//  ImageTileCell.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/10.
//

import UIKit

class ImageTileCell: UICollectionViewCell {

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var subTitleLabel: UILabel!
	@IBOutlet weak var bottomImageView: UIImageView!
	@IBOutlet weak var contentBackgroundView: UIView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
		
		animate()
    }
	
	override func layoutSubviews() {
		contentBackgroundView.backgroundColor = .lightGray
	}
	
	func bind(model: ImageTileModel) {
		titleLabel.text = model.title
		subTitleLabel.text = model.subTitle
//		bottomImageView.image = model.imageURL
	}
	
	func animate() {
		print("animated")
		contentView.frame.origin.y -= 50
	}
}

struct ImageTileModel {
	var title: String
	var subTitle: String
	var imageURL: String
}
