//
//  SmartOfferSectionController.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/03.
//

import Foundation
import UIKit

class SmartOfferSectionController: GenaralSectionController<SmartOfferCell, SmartOfferSectionViewModel> {
	
	override func configureCell(_ cell: SmartOfferCell, row: Int) {
		if let rowViewModel = viewModel.rowViewModel as? SmartOfferViewModel {
			cell.bind(viewModel: rowViewModel)
		}
		
	}
}
