//
//  SubContentSectionController.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/03.
//

import Foundation
import UIKit

class SubContentSectionController: GenaralSectionController<SubContentCell, SubContentSectionViewModel> {
	
	override func headerView() -> UIView {
		let headerView = SubContentHeaderView()
		
		if let headerViewModel = viewModel.headerViewModel as? SubContentHeaderViewModel {
			headerView.bind(viewModel: headerViewModel)
		}
		return headerView
	}
	
	override func footerView() -> UIView? {
		let footerView = SubContentFooterView()
		
		if let footerViewModel = viewModel.footerViewModel as? SubContentFooterViewModel {
			footerView.bind(viewModel: footerViewModel)
		}
		return footerView
	}
	
	override func configureCell(_ cell: SubContentCell, row: Int) {
		
		if let viewModel = viewModel.rowViewModel as? SubContentViewModel {
			cell.bind(content: viewModel.contents[row])
		}
	}
}
