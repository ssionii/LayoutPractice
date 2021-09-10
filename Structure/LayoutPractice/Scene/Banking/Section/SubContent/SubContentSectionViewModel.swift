//
//  SubContentViewModel.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/03.
//

import Foundation
import UIKit

class SubContentSectionViewModel: SectionViewModel {
	var headerViewModel: HeaderViewModel?
	var footerViewModel: FooterViewModel?
	var rowViewModel: RowViewModel
	var rowCount: Int
	
	init(
		headerViewModel: SubContentHeaderViewModel,
		footerViewModel: SubContentFooterViewModel,
		rowViewModel: SubContentViewModel
	) {
		self.headerViewModel = headerViewModel
		self.footerViewModel = footerViewModel
		self.rowViewModel = rowViewModel
		
		rowCount = rowViewModel.contents.count
	}
}

class SubContentViewModel: RowViewModel {
	var contents: [String]
	
	init(contents: [String]) {
		self.contents = contents
	}
}

class SubContentHeaderViewModel: HeaderViewModel {
	var headerHeight: CGFloat = CGFloat(40)
	
	var title: String
	var balance: String
	
	init(title: String, balance: String) {
		self.title = title
		self.balance = balance
	}
}

class SubContentFooterViewModel: FooterViewModel {
	var delegate: SubContentFooterDelegate?
	
	var footerHeight: CGFloat = CGFloat(40)
	var title: String
	
	init(title: String) {
		self.title = title
	}
}

protocol SubContentFooterDelegate {
	func tapButton()
}
