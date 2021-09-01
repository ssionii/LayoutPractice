//
//  MainTableCell.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/01.
//

import Foundation
import UIKit

class MainTableViewCell: UITableViewCell {
	func configure(content: MainContent) {
		print("configure 함수 override 필요: \(content.self)")
	}
}
