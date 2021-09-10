//
//  AssetCardFooterView.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/09.
//

import UIKit

protocol AssetCardFooterDelegate {
	func foldButtonClicked(isFold: Bool)
}

class AssetCardFooterView: UICollectionReusableView {
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var contentBackgroundView: UIView!
	@IBAction func foldButtonClicked(_ sender: Any) {
		isFold = !isFold
		self.delegate?.foldButtonClicked(isFold: isFold)
	}
	
	private var isFold = true
	private var delegate: AssetCardFooterDelegate?
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	
	override func layoutSubviews() {
		contentBackgroundView.backgroundColor = .yellow
	}
	
	func bind(model: AssetCardFooterModel) {
		self.delegate = model.delegate
		titleLabel.text = model.title
	}
}
