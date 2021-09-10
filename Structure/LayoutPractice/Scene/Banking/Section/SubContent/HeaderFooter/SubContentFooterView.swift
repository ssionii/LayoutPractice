//
//  SubContentFooterView.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/08.
//

import UIKit

class SubContentFooterView: UIView {
	
	let titleButton: UIButton = {
		let button = UIButton()
		button.frame = CGRect.init(x: 100, y: 10, width: 100, height: 20)
		return button
	}()
	
	private var viewModel: SubContentFooterViewModel?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
	}
		
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupView()
	}
	
	func setupView() {
		
		titleButton.addTarget(self, action: #selector(tapButton), for: UIControl.Event.touchUpInside)

		backgroundColor = .yellow
		addSubview(titleButton)
			
		NSLayoutConstraint.activate([
			titleButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			titleButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
			titleButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20)
		])
	}
	
	@objc func tapButton(_ sender: Any) {
		viewModel?.delegate?.tapButton()
	}
	
	func bind(viewModel: SubContentFooterViewModel) {
		titleButton.titleLabel?.text = viewModel.title
		
		self.viewModel = viewModel
	}
}
