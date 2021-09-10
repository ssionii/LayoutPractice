//
//  MyMenuViewModel.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/03.
//

import Foundation

protocol MyMenuDelegate: class {
	func clickMenu(_ menu: String)
}

class MyMenuSectionViewModel: SectionViewModel {
	var rowViewModel: RowViewModel
	
	init(rowViewModel: MyMenuViewModel) {
		self.rowViewModel = rowViewModel
	}
}

class MyMenuViewModel: RowViewModel {

	weak var delegate: MyMenuDelegate?
	
	var myMenus: [MyMenu]
	
	init(myMenus: [MyMenu]) {
		self.myMenus = myMenus
	}
}
