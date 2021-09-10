//
//  UITableViewCell+Extension.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/09.
//

import Foundation
import UIKit

protocol ReuseabelCell {
	static var reuseIdentifier: String { get }
}

extension ReuseabelCell {
	static var reuseIdentifier: String {
		return String(describing: self)
	}
}

extension UITableViewCell: ReuseabelCell {}
extension UITableViewHeaderFooterView: ReuseabelCell {}
extension UICollectionViewCell: ReuseabelCell {}
extension UICollectionReusableView: ReuseabelCell {}

extension UITableViewCell {
	func getIndexPath() -> IndexPath? {
		var indexPath: IndexPath?
		guard let superView = self.superview as? UITableView else {
			return nil
		}
		indexPath = superView.indexPathForRow(at: self.frame.origin)
		return indexPath
	}
}
