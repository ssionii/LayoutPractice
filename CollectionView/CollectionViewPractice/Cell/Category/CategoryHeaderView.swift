//
//  CategoryHeaderView.swift
//  CollectionViewPractice
//
//  Created by  60117280 on 2021/08/05.
//

import UIKit

protocol CategoryHeaderViewDelegate: class {
	func selectCategory(category: String)
}

class CategoryHeaderView: UITableViewHeaderFooterView {
	
	static let ID = "CategoryHeaderView"
	
	@IBOutlet weak var categoryCollectionView: UICollectionView!
	
	private var categories = [String]()
	
	weak var delegate: CategoryHeaderViewDelegate?
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		configureCollectionView()
	}
	
	override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: reuseIdentifier)
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
	private func configureCollectionView() {
		categoryCollectionView.delegate = self
		categoryCollectionView.dataSource = self
		
		categoryCollectionView.register(UINib(nibName: CategoryCell.ID, bundle: nil), forCellWithReuseIdentifier: CategoryCell.ID)
		
		if let collectionViewLayout = categoryCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
			collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
		}
	}
	
	func configureCategories(categories: [String]) {
		self.categories = categories
	}
}

extension CategoryHeaderView: UICollectionViewDelegate, UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return categories.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.ID, for: indexPath) as! CategoryCell
		cell.bind(text: categories[indexPath.row])
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
	
		delegate?.selectCategory(category: categories[indexPath.row])
	}
}



