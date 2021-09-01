//
//  BankingViewModel.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/08/30.
//

import Foundation
import UIKit

class BankingViewModel {

	var sections: [MainSection] = []
	// test 용
	private let isPB = false
	
	init() {
		fetchDummyData()
	}
	
	func insertSmartOffer() -> String {
		// 따로 SmartOffer 불러오기
		let smartOfferSection = SmartOfferSection(content: SmartOfferContent(url: "hello"))
		sections.insert(smartOfferSection, at: sections.count - 1)
		
		return smartOfferSection.cellID
	}
	
	private func fetchDummyData() {
		// account
		let ourBankAccounts = [
			Account(name: "입출금 쏠편한 입출금 통장1", accountNumber: "110-324-294656", balance: "1,200,400원"),
			Account(name: "입출금 쏠편한 입출금 통장2", accountNumber: "110-324-294656", balance: "894,600,000원"),
			Account(name: "입출금 쏠편한 입출금 통장3", accountNumber: "110-324-294656", balance: "3,400원")
		]
		
		let otherBankAccounts = [
			Account(name: "카카오뱅크 통장", accountNumber: "274-339-573924", balance: "8,700,000원")
		]
		
		let bankingCoreContent = BankingCoreContent(
			ourBankAccount: ourBankAccounts,
			otherBankAccount: otherBankAccounts
		)
		let bankingCoreSection = BankingCoreSection(content: bankingCoreContent)
		sections.append(bankingCoreSection)
		
		// myMenu
		let myMenus = [
			MyMenu(text: "신한플러스", color: .blue),
			MyMenu(text: "자금모으기", color: .blue),
			MyMenu(text: "MY리포트", color: .systemPink)
		]
		
		let myMenuSection = MyMenuSection(content: MyMenuContent(myMenus: myMenus))
		sections.append(myMenuSection)
		
		let subContentSection = SubContentSection(content: SubContent(text: "이건 subcontent 다"))
		sections.append(subContentSection)
		
		let platformSection = PlatformSection(content: PlatformContent(text: "이건 platform이다"))
		sections.append(platformSection)
	}
}
