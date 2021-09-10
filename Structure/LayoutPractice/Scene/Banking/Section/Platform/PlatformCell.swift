//
//  PlatformCell.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/08/30.
//

import UIKit

class PlatformCell: UITableViewCell {

	@IBOutlet weak var contentBackgroundView: UIView!
	@IBOutlet weak var contentLabel: UILabel!
	
	private var viewModel: PlatformViewModel?
	
	override func awakeFromNib() {
        super.awakeFromNib()
		
    }
	
	override func layoutSubviews() {
		configureUI()
	}
	
	func bind(viewModel: PlatformViewModel) {
		self.viewModel = viewModel
		
		contentLabel.text = viewModel.content
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
