//
//  AssetExtensionCell.swift
//  CollectionViewPractice
//
//  Created by  60117280 on 2021/08/05.
//

import UIKit

class AssetExtensionCell: UITableViewCell {
	
	static let ID = "AssetExtensionCell"
	
	@IBOutlet weak var mainView: UIView!
	@IBOutlet weak var bottomView: UIView!
	
	@IBOutlet weak var bottomViewHeight: NSLayoutConstraint!
	private var isExpanded = false

	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
//		mainView.translatesAutoresizingMaskIntoConstraints = false
    }
	
	func startAnimation() {
		if !isExpanded {
			self.bottomViewHeight.constant = 150
			UIView.animate(withDuration: 1.0, animations: {
				self.bottomView.isHidden = false
				self.contentView.layoutIfNeeded()
				self.mainView.backgroundColor = .cyan
			})
			isExpanded = true
		} else {
			self.bottomViewHeight.constant = 0
			UIView.animate(withDuration: 1.0, animations: {
				self.bottomView.isHidden = true
				self.contentView.layoutIfNeeded()
				self.mainView.backgroundColor = .purple
			})
			isExpanded = false
		}
		
	}
}
