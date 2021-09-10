//
//  SmartOfferViewModel.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/03.
//

import Foundation

class SmartOfferSectionViewModel: SectionViewModel {
	var rowViewModel: RowViewModel
	
	init(rowViewModel: SmartOfferViewModel) {
		self.rowViewModel = rowViewModel
	}
}

class SmartOfferViewModel: RowViewModel {
	var url: String
	
	init(url: String) {
		self.url = url
	}
}
