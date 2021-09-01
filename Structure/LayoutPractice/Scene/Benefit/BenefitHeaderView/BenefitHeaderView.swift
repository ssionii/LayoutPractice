//
//  BenefitHeaderView.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/01.
//

import UIKit

class BenefitHeaderView: MainHeaderView {

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var contentBackgroundView: UIView!
	
	override func layoutSubviews() {
		contentBackgroundView.backgroundColor = .yellow
	}
	
	override func configure(content: MainHeaderContent) {
		if let content = content as? BenefitHeaderContent {
			self.titleLabel.text = content.text
		} else {
			
		}
	}
}
