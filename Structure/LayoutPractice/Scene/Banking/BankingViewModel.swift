//
//  BankingViewModel.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/08/30.
//

import Foundation
import UIKit

class BankingViewModel {

	var sections: [MainSectionable] = []
	
	// test 용
	private let isPB = false
	
	init() {
		fetchDummyData()
	}

	func insertSmartOffer() {
		// 따로 SmartOffer 불러오기
		let smartOfferSectionViewModel = SmartOfferSectionViewModel(
			rowViewModel: SmartOfferViewModel(url: "여깁니다.")
		)
			
			
		sections.insert(SmartOfferSection(viewModel: smartOfferSectionViewModel), at: sections.count - 1)
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
		
		let bankingCoreSectionViewModel = BankingCoreSectionViewModel(
			viewModel: BankingCoreViewModel(
				ourBankAccounts: ourBankAccounts,
				otherBankAccounts: otherBankAccounts
			)
		)
		sections.append(BankingCoreSection(viewModel: bankingCoreSectionViewModel))
		
		// myMenu
		let myMenus = [
			MyMenu(text: "신한플러스", color: .blue),
			MyMenu(text: "자금모으기", color: .blue),
			MyMenu(text: "MY리포트", color: .systemPink)
		]
		
		let myMenuSectionViewModel = MyMenuSectionViewModel(
			rowViewModel: MyMenuViewModel(myMenus: myMenus)
		)
		
		sections.append(MyMenuSection(viewModel: myMenuSectionViewModel))
		
		// subcontent
		let subContentHeaderViewModel = SubContentHeaderViewModel(title: "입출금", balance: "13,640,000원")
		let subContentFooterViewModel = SubContentFooterViewModel(title: "접기")
		subContentFooterViewModel.delegate = self
		let subContentSectionViewModel = SubContentSectionViewModel(
			headerViewModel: subContentHeaderViewModel,
			footerViewModel: subContentFooterViewModel,
			rowViewModel: SubContentViewModel(contents: ["1", "2", "3"])
		)
		
		sections.append(BankingSubContentSection(viewModel: subContentSectionViewModel))
		
		// platform
	}
}

extension BankingViewModel: BankingCoreDelegate {
	func transferButtonClicked() {
		print("이체 버튼 클릭")
	}
}

extension BankingViewModel: MyMenuDelegate {
	func clickMenu(_ menu: String) {
		print("\(menu) 메뉴 클릭")
	}
}

extension BankingViewModel: SubContentFooterDelegate {
	func tapButton() {
	}
}
