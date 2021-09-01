//
//  HorizontalScrollableCell.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/01.
//

import UIKit

class HorizontalScrollableCell: MainTableViewCell {

	@IBOutlet weak var collectionView: UICollectionView!
	
	var contents: [SubscriptionModel]? {
		didSet {
			collectionView.reloadData()
		}
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	override func layoutSubviews() {
		configureCollectionView()
	}

	override func configure(content: MainContent) {
		if let content = content as? HorizontalScrollableCell {
			self.contents = content.contents
		}
	}
	
	private func configureCollectionView() {
		collectionView.delegate = self
		collectionView.dataSource = self
		
		collectionView.register(UINib(nibName: SubscriptionCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: SubscriptionCollectionViewCell.reuseIdentifier)
	}
}

extension HorizontalScrollableCell: UICollectionViewDelegate {
	
}

extension HorizontalScrollableCell: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return contents?.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubscriptionCollectionViewCell.reuseIdentifier, for: indexPath) as? SubscriptionCollectionViewCell,
			  let content = contents?[indexPath.row] else {
			return UICollectionViewCell()
		}
		cell.configure(model: content)
		return cell
	}
}

extension HorizontalScrollableCell: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.width / 2 - 20, height: collectionView.frame.height)
	}
}
