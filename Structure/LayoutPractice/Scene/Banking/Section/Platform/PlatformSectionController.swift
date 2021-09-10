//
//  PlatformSectionController.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/03.
//

import Foundation

class PlatformSectionController: GenaralSectionController<PlatformCell, PlatformSectionViewModel> {
	
	override func configureCell(_ cell: PlatformCell, row: Int) {
		if let rowViewModel = viewModel.rowViewModel as? PlatformViewModel {
			cell.bind(viewModel: rowViewModel)
		}
	}
}
