//
//  SubContentCell.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/08/30.
//

import UIKit

class SubContentCell: UITableViewCell {

	@IBOutlet weak var contentBackgroundView: UIView!
	@IBOutlet weak var contentLabel: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
    }
	
	override func layoutSubviews() {
		configureUI()
	}
	
	func bind(content: String) {
		contentLabel.text = content
	}
	
	private func configureUI() {
		self.contentBackgroundView.layer.cornerRadius = 14
		self.contentBackgroundView.layer.shadowOpacity = 0.12
		self.contentBackgroundView.layer.shadowColor = UIColor.black.cgColor
		self.contentBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 0)
		
		contentBackgroundView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: horizontalMarginInMain).isActive = true
		contentBackgroundView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -horizontalMarginInMain).isActive = true
	}
}
