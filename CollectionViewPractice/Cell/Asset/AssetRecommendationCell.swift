//
//  AssetRecomendTableViewCell.swift
//  CollectionViewPractice
//
//  Created by  60117280 on 2021/08/05.
//

import UIKit

class AssetRecommendationCell: UITableViewCell {
	
	static let ID = "AssetRecommendationCell"
	
	@IBOutlet weak var aiRecommendAssetCollectionView: UICollectionView!
	@IBOutlet weak var bestRecommendAssetCollectionVIew: UICollectionView!
	
	var assets = [[Asset]]()
	
    override func awakeFromNib() {
        super.awakeFromNib()
		
		setCollectionView()
    }
	
	func bind(assets: [[Asset]]) {
		self.assets = assets
	}
	
	private func setCollectionView() {
		self.aiRecommendAssetCollectionView.delegate = self
		self.aiRecommendAssetCollectionView.dataSource = self
		
		self.bestRecommendAssetCollectionVIew.delegate = self
		self.bestRecommendAssetCollectionVIew.dataSource = self
		
		aiRecommendAssetCollectionView.register(UINib(nibName: AssetCell.ID, bundle: nil), forCellWithReuseIdentifier: AssetCell.ID)
		
		bestRecommendAssetCollectionVIew.register(UINib(nibName: AssetCell.ID, bundle: nil), forCellWithReuseIdentifier: AssetCell.ID)
	}
}

extension AssetRecommendationCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		var assetIndex = 0
		
		if collectionView == self.aiRecommendAssetCollectionView {
			assetIndex = 0
		} else {
			assetIndex = 1
		}
		
		return self.assets[assetIndex].count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		var assetIndex = 0
		
		if collectionView == self.aiRecommendAssetCollectionView {
			assetIndex = 0
		} else {
			assetIndex = 1
		}
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AssetCell.ID, for: indexPath) as! AssetCell
		cell.bind(bank: assets[assetIndex][indexPath.row].bank, name: assets[assetIndex][indexPath.row].name)
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		return CGSize(width: collectionView.frame.size.width / 2.5 , height: collectionView.frame.size.height)
	}
}
