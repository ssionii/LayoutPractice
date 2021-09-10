//
//  AssetCardSectionModel.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/09.
//

import Foundation

class AssetCardSectionModel: SectionModel {
	var rowCount: Int = 1
	var rowModels: [RowModelable]
	var headerModel: HeaderModelable?
	var footerModel: FooterModelable?
	
	init(rowModels: [RowModelable], headerModel: HeaderModelable, footerModel: FooterModelable) {
		self.rowModels = rowModels
		self.headerModel = headerModel
		self.footerModel = footerModel
	}
}

struct AssetCardRowModel: RowModelable {
	var title: String
	
	init(title: String) {
		self.title = title
	}
}

struct AssetCardHeaderModel: HeaderModelable {
	var title: String
	
	init(title: String) {
		self.title = title
	}
}

struct AssetCardFooterModel: FooterModelable {
	var delegate: AssetCardFooterDelegate?
	
	var title: String
	
	init(title: String) {
		self.title = title
	}
}
