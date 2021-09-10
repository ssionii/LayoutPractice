//
//  UITableView+Extension.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/09.
//

import Foundation
import UIKit

extension UITableView {
	func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
		guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
			fatalError("Unable Dequeue Reusable!")
		}
		return cell
	}

	func register<T: UITableViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
		let className = cellType.reuseIdentifier
		let nib = UINib(nibName: className, bundle: bundle)
		register(nib, forCellReuseIdentifier: className)
	}

	func register<T: UITableViewCell>(cellTypes: [T.Type], bundle: Bundle? = nil) {
		cellTypes.forEach { [weak self] in
			guard let self = `self` else { return }
			self.register(cellType: $0, bundle: bundle)
		}
	}

	func register<T: UITableViewHeaderFooterView>(cellType: T.Type, bundle: Bundle? = nil) {
		let className = cellType.reuseIdentifier
		let nib = UINib(nibName: className, bundle: bundle)
		register(nib, forHeaderFooterViewReuseIdentifier: className)
	}
}


extension UITableView {
	func dequeueCell<T>(at indexPath: IndexPath) -> T where  T: ReuseabelCell {
		guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
			fatalError("Unexpected ReusableCell Type for reuseID \(T.reuseIdentifier)")
		}
		return cell
	}

	func register(reusableCellType: ReuseabelCell.Type) {
		let className = reusableCellType.reuseIdentifier
		let nib = UINib(nibName: className, bundle: nil)
		register(nib, forCellReuseIdentifier: className)
	}
}
