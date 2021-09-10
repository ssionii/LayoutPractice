//
//  MainSection.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/01.
//

import Foundation
import UIKit

protocol ReuseableCellType: class {
	associatedtype CellHolderType: ReuseableCellHolderType where CellHolderType.CellType == Self
}

protocol ReuseableCellHolderType: class {
	associatedtype CellType: ReuseableCellType where CellType.CellHolderType == Self
	
	func register(_ nib: UINib?, forCellWithReuseIdentifier identifier: String)
	func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> CellType
}

extension UITableViewCell: ReuseableCellType {
	typealias CellHolderType = UITableView
}

extension UICollectionViewCell: ReuseableCellType {
	typealias CellHolderType = UICollectionView
}

extension UITableView: ReuseableCellHolderType {
	
	func register(_ nib: UINib?, forCellWithReuseIdentifier identifier: String) {
		register(nib, forCellReuseIdentifier: identifier)
	}
	
	func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
		return dequeueReusableCell(withIdentifier: identifier, for: indexPath)
	}
}

extension UICollectionView: ReuseableCellHolderType {
	
}

protocol MainSectionControllerType {
	associatedtype ViewType: ReuseableCellHolderType
	
	static func registerCell(on reusableCellHolder: ViewType)
	func cellFromReusableCellHolder(_ reusableCellHolder: ViewType, forIndexPath indexPath: IndexPath) -> ViewType.CellType
}


class SectionController<T: ReuseableCellHolderType>: MainSectionControllerType {
	typealias ViewType = T
	
	class var cellClass: AnyClass {
		fatalError("Must be implemented by children")
	}
	
	static var cellIdentifier: String {
		return String(describing: cellClass)
	}
	
	static func registerCell(on reusableCellHolder: T) {
		let bundle = Bundle(for: cellClass)
		let nib = UINib(nibName: cellIdentifier, bundle: bundle)
		reusableCellHolder.register(nib, forCellWithReuseIdentifier: cellIdentifier)
	}
	
	func cellFromReusableCellHolder(_ reusableCellHolder: T, forIndexPath indexPath: IndexPath) -> T.CellType {
		let cell = reusableCellHolder.dequeueReusableCell(withReuseIdentifier: type(of: self).cellIdentifier, for: indexPath)
		configureCell(cell, row: indexPath.row)
		return cell
	}
	
	func headerView() -> UIView? {
		return nil
	}
	
	func footerView() -> UIView? {
		return nil
	}
	
	func configureCell(_ cell: T.CellType, row: Int) {
		// 자식 클래스에서 override하여 구현
	}
}

class GenaralSectionController<Cell: ReuseableCellType, ViewModel: SectionViewModel> : SectionController<Cell.CellHolderType> {
	
	var viewModel: ViewModel

	init(viewModel: ViewModel) {
		self.viewModel = viewModel
	}
	
	final override class var cellClass: AnyClass {
		return Cell.self
	}
	
	override func configureCell(_ cell: Cell, row: Int) {
		// 자식 클래스에서 override 하여 구현
		// TODO: Cell이 아니라 어떤 protocol을 받아서 (bind 함수를 가진) 여기서 binding 해버리면 안되나? ㅇㅅㅇ?
	}
	
	override func headerView() -> UIView? {
		return nil
	}
	
	override func footerView() -> UIView? {
		return nil
	}
}
