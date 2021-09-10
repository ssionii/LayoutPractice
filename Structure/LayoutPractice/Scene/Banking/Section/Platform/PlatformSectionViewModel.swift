//
//  PlatformViewModel.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/03.
//

import Foundation

class PlatformSectionViewModel: SectionViewModel {
	var rowViewModel: RowViewModel
	
	init(rowViewModel: PlatformViewModel) {
		self.rowViewModel = rowViewModel
	}
}

class PlatformViewModel: RowViewModel {
	var content: String
	
	init(content: String) {
		self.content = content
	}
}
