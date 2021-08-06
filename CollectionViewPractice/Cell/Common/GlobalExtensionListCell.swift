//
//  GlobalExtensionCell.swift
//  CollectionViewPractice
//
//  Created by  60117280 on 2021/08/05.
//

import UIKit

class GlobalExtensionListCell: UITableViewCell {

	static let ID = "GlobalExtensionListCell"
	
	@IBOutlet weak var collectionView: UICollectionView!
	
	var list = [String]()
	
    override func awakeFromNib() {
        super.awakeFromNib()
		
		setCollectionView()
    }
	
	private func setCollectionView() {
		collectionView.delegate = self
		collectionView.dataSource = self
		
		collectionView.register(UINib(nibName: GlobalExtensionCell.ID, bundle: nil), forCellWithReuseIdentifier: GlobalExtensionCell.ID)
	}
	
	func bind(list: [String]) {
		self.list = list
	}
    
}

extension GlobalExtensionListCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return list.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GlobalExtensionCell.ID, for: indexPath) as! GlobalExtensionCell
		cell.bind(text: list[indexPath.row])
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		return CGSize(width: collectionView.frame.size.width / 2 , height: collectionView.frame.size.height)
	}
	
}
