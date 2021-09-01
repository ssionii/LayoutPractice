//
//  UITableViewCell.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/08/31.
//

import UIKit

protocol ReuseableView: class {}

extension ReuseableView where Self: UIView {
	static var reuseIdentifier: String {
		return String(describing: self)
	}
}

extension UITableViewCell: ReuseableView {}
extension UITableViewHeaderFooterView: ReuseableView {}
extension UICollectionViewCell: ReuseableView {}
