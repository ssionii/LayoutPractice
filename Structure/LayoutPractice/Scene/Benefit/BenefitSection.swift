//
//  BenefitSection.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/01.
//

import Foundation
import UIKit

protocol BenefitSection {

	var headerContent: MainHeaderContent? { get }
}

extension BenefitSection {
	var headerContent: MainHeaderContent? {
		return nil
	}
}

struct CustomSection: BenefitSection {
	var cellID: String = HorizontalScrollableCell.reuseIdentifier
	var content: MainContent
	
	init(content: CustomContent) {
		self.content = content
	}
}

struct FunSection: BenefitSection {
	var cellID: String = HorizontalScrollableCell.reuseIdentifier
	var content: MainContent
	var headerViewID: String? = BenefitHeaderView.reuseIdentifier
	var headerContent: MainHeaderContent?
	
	init(content: FunContent, headerContent: BenefitHeaderContent) {
		self.content = content
		self.headerContent = headerContent
	}
}

struct CouponSection: BenefitSection {
	var cellID: String = HorizontalScrollableCell.reuseIdentifier
	var content: MainContent
	
	init(content: CouponContent) {
		self.content = content
	}
}

struct ManagementSection: BenefitSection {
	var cellID: String = HorizontalScrollableCell.reuseIdentifier
	var content: MainContent
	
	init(content: ManagementContent) {
		self.content = content
	}
}

struct LifeFinanceSection: BenefitSection {
	var cellID: String = HorizontalScrollableCell.reuseIdentifier
	var content: MainContent
	
	init(content: LifeFinaceContent) {
		self.content = content
	}
}
