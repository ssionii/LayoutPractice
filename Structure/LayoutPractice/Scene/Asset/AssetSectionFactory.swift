//
//  AssetSectionFactory.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/09.
//

import Foundation
import UIKit

// as! 어쩌구 extension으로 짤 수 있음..


class AssetSectionFactory {
	
	private var collectionView: UICollectionView?
	
	// MARK: - Cell
	
	func rowCell(with section: AssetSectionable, indexPath: IndexPath) -> UICollectionViewCell? {
		switch section.type {
		case .AssetCard:
			let cell = collectionView?.dequeueReusableCell(withReuseIdentifier: AssetCardContentCell.reuseIdentifier, for: indexPath) as! AssetCardContentCell
			if let rowModel = section.model.rowModels[indexPath.row] as? AssetCardRowModel {
				cell.bind(model: rowModel)
			}
			return cell
		case .Content:
			let cell = collectionView?.dequeueReusableCell(withReuseIdentifier: ImageTileCell.reuseIdentifier, for: indexPath) as! ImageTileCell
			if let rowModel = section.model.rowModels[indexPath.row] as? AssetContentRowModel {
				cell.bind(model: rowModel.toImageTileModel())
			}
			return cell
		case .Analysis:
			return UICollectionViewCell()
		}
	}
	
	func headerView(with section: AssetSectionable, indexPath: IndexPath) -> UICollectionReusableView? {
		switch section.type {
		case .AssetCard:
			let headerView = collectionView?.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AssetCardHeaderView.reuseIdentifier, for: indexPath) as! AssetCardHeaderView
			if let headerModel = section.model.headerModel as? AssetCardHeaderModel {
				headerView.bind(model: headerModel)
			}
			return headerView
		default:
			return UICollectionReusableView()
		}
	}
	
	func footerView(with section: AssetSectionable, indexPath: IndexPath) -> UICollectionReusableView? {
		switch section.type {
		case .AssetCard:
			let footerView = collectionView?.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: AssetCardFooterView.reuseIdentifier, for: indexPath) as! AssetCardFooterView
			if let footerModel = section.model.footerModel as? AssetCardFooterModel {
				footerView.bind(model: footerModel)
			}
			return footerView
		default:
			return UICollectionReusableView()
		}
	}
	
	// MARK: - Size
	
	func rowCellSize(with section: AssetSectionable, indexPath: IndexPath) -> CGSize {

		let fullWidthWithMargin = screenWidth - (horizontalMarginInMain * 2)
		
		switch section.type {
		case .AssetCard:
			// TODO: cell, header, footer 별 width, height 는 따로 관리하는게 좋을 듯
			return CGSize(width: fullWidthWithMargin, height: 100)
		case .Content:
			return CGSize(width: (fullWidthWithMargin / 2) - 10, height: 200)
		default:
			return CGSize.zero
		}
	}
	
	func headerViewSize(with section: AssetSectionable, sectionIndex: Int) -> CGSize {
		let fullWidthWithMargin = screenWidth - (horizontalMarginInMain * 2)
		
		switch section.type {
		case .AssetCard:
			return CGSize(width: fullWidthWithMargin, height: 48)
		default:
			return CGSize.zero
		}
	}
	
	func footerViewSize(with section: AssetSectionable, sectionIndex: Int) -> CGSize {
		let fullWidthWithMargin = screenWidth - (horizontalMarginInMain * 2)
		
		switch section.type {
		case .AssetCard:
			return CGSize(width: fullWidthWithMargin, height: 48)
		default:
			return CGSize.zero
		}
	}
	
	func register(on collectionView: UICollectionView) {
		
		self.collectionView = collectionView
		
		collectionView.register(cellType: AssetCardContentCell.self)
		collectionView.register(cellType: ImageTileCell.self)
		
		registerHeaderFooter(on: collectionView)
	}
	
	func registerHeaderFooter(on collectionView: UICollectionView) {
		
		collectionView.register(UINib(nibName: AssetCardHeaderView.reuseIdentifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AssetCardHeaderView.reuseIdentifier)
		collectionView.register(UINib(nibName: AssetCardFooterView.reuseIdentifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: AssetCardFooterView.reuseIdentifier)
	}
}
