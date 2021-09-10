//
//  MainSectionFactory.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/02.
//

import Foundation
import UIKit

class BankingSectionFactory {
	
	func registerCells(on tableView: UITableView) {
		BankingCoreSectionController.registerCell(on: tableView.self)
		MyMenuSectionController.registerCell(on: tableView.self)
		SubContentSectionController.registerCell(on: tableView.self)
		SmartOfferSectionController.registerCell(on: tableView.self)
		PlatformSectionController.registerCell(on: tableView.self)
	}
	
	func sectionController(with section: MainSectionable) -> SectionController<UITableView>? {

		switch section.type {
		case .BankingCore:
			return BankingCoreSectionController(viewModel: section.sectionViewModel as! BankingCoreSectionViewModel)
		case .MyMenu:
			return MyMenuSectionController(viewModel: section.sectionViewModel as! MyMenuSectionViewModel)
		case .BankingSubContent:
			return SubContentSectionController(viewModel: section.sectionViewModel as! SubContentSectionViewModel)
		case .SmartOffer:
			return SmartOfferSectionController(viewModel: section.sectionViewModel as! SmartOfferSectionViewModel)
		case .BankingPlatform:
			return PlatformSectionController(viewModel: section.sectionViewModel as! PlatformSectionViewModel)
		}
			
//
//		if let viewModel = viewModel as? BankingCoreViewModel {
//
//		} else if let viewModel = viewModel as? MyMenuViewModel {
//
//		} else if let viewModel = viewModel as? SubContentViewModel {
//			return SubContentSectionController(viewModel: viewModel)
//		} else if let viewModel = viewModel as? SmartOfferViewModel {
//			return SmartOfferSectionController(viewModel: viewModel)
//		} else if let viewModel = viewModel as? PlatformViewModel {
//			return PlatformSectionController(viewModel: viewModel)
//		}
//
		// FIXME: 여기 nil이 들어가는게 맞나?
		return nil
	}
}
