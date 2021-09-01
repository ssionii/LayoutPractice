//
//  BankingCoreContent.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/01.
//

import Foundation
import UIKit

// 요거는 공통적으로 쓰이는 거..
struct SubscriptionModel {
	var title: String
	var subscription: String
	var imageURLString: String
}

struct titleModel {
	var title: String
}

struct CustomContent: SubscriptionContent {
	var contents: [SubscriptionModel]
}

struct FunContent: SubscriptionContent {
	var contents: [SubscriptionModel]
}

struct CouponContent: SubscriptionContent {
	var contents: [SubscriptionModel]
}

struct ManagementContent: SubscriptionContent {
	var contents: [SubscriptionModel]
}

struct LifeFinaceContent: MainContent {
	var contents: [titleModel]
}

// 이게 맞나?
protocol SubscriptionContent: MainContent {
	var contents: [SubscriptionModel] { get }
}

struct BenefitHeaderContent: MainHeaderContent {
	var text: String
}

