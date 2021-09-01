//
//  CategoryCell.swift
//  CollectionViewPractice
//
//  Created by  60117280 on 2021/08/06.
//

import UIKit

class CategoryCell: UICollectionViewCell {

	static let ID = "CategoryCell"
	
	@IBOutlet weak var mainView: UIView!
	@IBOutlet weak var text: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
		
		self.backgroundColor = .brown
		
		mainView.translatesAutoresizingMaskIntoConstraints = false
    }
	
	func bind(text: String) {
		self.text.text = text
	}
}
