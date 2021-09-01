//
//  BankingSection.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/08/31.
//

import Foundation
import UIKit

protocol BankingSection: MainSection {
	
}

struct BankingCoreSection: BankingSection {
	var cellID: String = BankingCoreCell.reuseIdentifier
	var content: MainContent
	
	init(content: BankingCoreContent) {
		self.content = content
	}
}

struct PBSection: BankingSection {
	var cellID: String = PBCell.reuseIdentifier
	var content: MainContent
	
	init(content: PBContent) {
		self.content = content
	}
}

struct MyMenuSection: BankingSection {
	var cellID: String = MyMenuCell.reuseIdentifier
	var content: MainContent
	
	init(content: MyMenuContent) {
		self.content = content
	}
}

struct SubContentSection: BankingSection {
	var cellID: String = SubContentCell.reuseIdentifier
	var content: MainContent
	
	init(content: SubContent) {
		self.content = content
	}
}

struct SmartOfferSection: BankingSection {
	var cellID: String = SmartOfferCell.reuseIdentifier
	var content: MainContent
	
	init(content: SmartOfferContent) {
		self.content = content
	}
}

struct PlatformSection: BankingSection {
	var cellID: String = PlatformCell.reuseIdentifier
	var content: MainContent
	
	init(content: PlatformContent) {
		self.content = content
	}
}
