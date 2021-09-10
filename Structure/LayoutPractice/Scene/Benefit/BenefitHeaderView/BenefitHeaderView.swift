//
//  BenefitHeaderView.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/01.
//

import UIKit

class BenefitHeaderView: UITableViewHeaderFooterView {

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var contentBackgroundView: UIView!
	
	private var viewModel: BenefitHeaderViewModel?
	
	override func layoutSubviews() {
		contentBackgroundView.backgroundColor = .yellow
	}
	
	func configure(viewModel: BenefitHeaderViewModel){
		self.viewModel = viewModel
		
		bind()
	}
	
	private func bind() {
		titleLabel.text = viewModel?.title
	}
}
