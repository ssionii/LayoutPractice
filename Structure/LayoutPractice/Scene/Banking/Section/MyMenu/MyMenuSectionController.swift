//
//  MyMenuSectionController.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/03.
//

import Foundation

class MyMenuSectionController: GenaralSectionController<MyMenuCell, MyMenuSectionViewModel> {
	
	override func configureCell(_ cell: MyMenuCell, row: Int) {
		if let rowViewModel = viewModel.rowViewModel as? MyMenuViewModel {
			cell.bind(viewModel: rowViewModel)
		}
	}
}
