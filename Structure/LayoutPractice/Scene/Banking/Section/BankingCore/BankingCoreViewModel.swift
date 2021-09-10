//
//  BankingCoreViewModel.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/03.
//

import Foundation

protocol BankingCoreDelegate: class {
	func transferButtonClicked()
}

class BankingCoreSectionViewModel: SectionViewModel {
	var rowViewModel: RowViewModel
	var rowCount: Int
	
	init(viewModel: BankingCoreViewModel) {
		self.rowViewModel = viewModel
		self.rowCount = 1
	}
}

class BankingCoreViewModel: RowViewModel {
	var ourBankAccounts: [Account]
	var otherBankAccounts: [Account]
	
	weak var delegate: BankingCoreDelegate?
	
	init(ourBankAccounts: [Account], otherBankAccounts: [Account]) {
		self.ourBankAccounts = ourBankAccounts
		self.otherBankAccounts = otherBankAccounts
	}
}
