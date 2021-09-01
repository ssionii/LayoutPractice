//
//  BenefitViewModel.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/01.
//

import Foundation

class BenefitViewModel {
	var sections: [BenefitSection] = []
	
	init() {
		fetchDummyData()
	}
	
	private func fetchDummyData() {
		let customContents = [
			SubscriptionModel(title: "헤이영놀이터", subscription: "20대 전용존!\n11만명 이용중!", imageURLString: ""),
			SubscriptionModel(title: "전기차 가격 조회", subscription: "사고 싶었던\n전기차 최저가는?", imageURLString: "")
		]
		let customSection = CustomSection(
			content: CustomContent(contents: customContents))
		sections.append(customSection)
		
		let funContents = [
			SubscriptionModel(title: "야구", subscription: "무관중도 우릴\n막을 순 없지!", imageURLString: ""),
			SubscriptionModel(title: "운세", subscription: "오늘 하루,\n나의 운세는?", imageURLString: ""),
			SubscriptionModel(title: "게임", subscription: "심심하다면?\n신나는 게임 한판!", imageURLString: "")
		]
		let funSection = FunSection(content: FunContent(contents: funContents), headerContent: BenefitHeaderContent(text: "내가 Fun의 헤더다\n마 이게 두번째 줄이다."))
		sections.append(funSection)
		
//		let couponContents = [
//			SubscriptionModel(title: "모바일 쿠폰마켓", subscription: "모바일 쿠폰 알뜰하게 거래하기", imageURLString: ""),
//			SubscriptionModel(title: "지역 상품권 구매", subscription: "지역 상품권으로 10% 할인받기", imageURLString: "")
//		]
//		let couponSection = CouponSection(content: CouponContent(contents: couponContents))
//		sections.append(couponSection)
	}
}
