//
//  AssetSection.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/09.
//

import Foundation
import UIKit

enum AssetSectionType: SectionType {
	case AssetCard
	case Content
	case Analysis
}

enum BankingSectionType: SectionType {
	
}

protocol SectionType {
	
}

protocol AssetSectionable {
	var type: AssetSectionType { get }
	var model: SectionModel { get }
}

protocol BankingSectionable {
	var type: BankingSectionType { get }
	var model: SectionModel { get }
}

protocol SectionModel {
	var rowModels: [RowModelable] { get }
	var rowCount: Int { get }
	var headerModel: HeaderModelable? { get }
	var footerModel: FooterModelable? { get }
}

extension SectionModel {
	var headerModel: HeaderModelable? {
		return nil
	}
	var footerModel: FooterModelable? {
		return nil
	}
}

protocol RowModelable {
}

protocol HeaderModelable {
}

protocol FooterModelable {
}

struct AssetCardSection: AssetSectionable {
	var type: AssetSectionType = .AssetCard
	var model: SectionModel
	
	init(model: AssetCardSectionModel) {
		self.model = model
	}
}

struct AssetContentSection: AssetSectionable {
	var type: AssetSectionType = .Content
	var model: SectionModel
	
	init(model: AssetContentSectionModel) {
		self.model = model
	}
}
