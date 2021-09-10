//
//  SubContentHeaderView.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/08.
//

import UIKit

class SubContentHeaderView: UIView {
	
	let titleLabel: UILabel = {
		let label = UILabel()
		label.frame = CGRect.init(x: 20, y: 10, width: 100, height: 20)
		return label
	}()
	
	let balanceLabel: UILabel = {
		let label = UILabel()
		label.frame = CGRect.init(x: 250, y: 10, width: 200, height: 20)
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
	}
		
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupView()
	}
	
	func setupView() {
		backgroundColor = .orange
		addSubview(titleLabel)
		addSubview(balanceLabel)
			
		NSLayoutConstraint.activate([
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
			titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20),
			balanceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			balanceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
			balanceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20)
		])
	}
	
	func bind(viewModel: SubContentHeaderViewModel) {
		titleLabel.text = viewModel.title
		balanceLabel.text = viewModel.balance
	}
}
