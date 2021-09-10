//
//  BankingCoreSectionController.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/03.
//

import Foundation
import UIKit

class BankingCoreSectionController: GenaralSectionController<BankingCoreCell, BankingCoreSectionViewModel> {
	
	override func configureCell(_ cell: BankingCoreCell, row: Int) {
		if let rowViewModel = viewModel.rowViewModel as? BankingCoreViewModel {
			cell.bind(viewModel: rowViewModel)
		}
	}
}
