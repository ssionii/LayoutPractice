//
//  MainSection.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/07.
//

import Foundation

enum MainSectionType {
	case BankingCore
	case MyMenu
	case BankingSubContent
	case SmartOffer
	case BankingPlatform
}

protocol MainSectionable {
	var type: MainSectionType { get }
	var sectionViewModel: SectionViewModel { get }
}

struct BankingCoreSection: MainSectionable {
	var type: MainSectionType = .BankingCore
	var sectionViewModel: SectionViewModel
	
	init(viewModel: BankingCoreSectionViewModel) {
		self.sectionViewModel = viewModel
	}
}

struct MyMenuSection: MainSectionable {
	var type: MainSectionType = .MyMenu
	var sectionViewModel: SectionViewModel
	
	init(viewModel: MyMenuSectionViewModel) {
		self.sectionViewModel = viewModel
	}
}

struct BankingSubContentSection: MainSectionable {
	var type: MainSectionType = .BankingSubContent
	var sectionViewModel: SectionViewModel
	
	init(viewModel: SubContentSectionViewModel) {
		self.sectionViewModel = viewModel
	}
}

struct SmartOfferSection: MainSectionable {
	var type: MainSectionType = .SmartOffer
	var sectionViewModel: SectionViewModel
	
	init(viewModel: SmartOfferSectionViewModel) {
		self.sectionViewModel = viewModel
	}
}

struct BankingPlatformSection: MainSectionable {
	var type: MainSectionType = .BankingPlatform
	var sectionViewModel: SectionViewModel
	
	init(viewModel: PlatformSectionViewModel) {
		self.sectionViewModel = viewModel
	}
}

