//
//  MainContent.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/08/31.
//

import Foundation
import UIKit

struct BankingCoreContent: MainContent {
	var ourBankAccount: [Account]
	var otherBankAccount: [Account]
}

struct Account {
	var name: String
	var accountNumber: String
	var balance: String
}

struct PBContent: MainContent {
	
}

struct MyMenuContent: MainContent {
	var myMenus: [MyMenu]
}

struct MyMenu {
	var text: String
	var color: UIColor
}

struct SubContent: MainContent {
	var text: String
}

struct SmartOfferContent: MainContent {
	var url: String
}

struct PlatformContent: MainContent {
	var text: String
}
