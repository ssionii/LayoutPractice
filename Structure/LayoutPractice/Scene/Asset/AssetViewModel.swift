//
//  AssetViewModel.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/09.
//

import Foundation

protocol AssetViewModelDelegate {
	func reloadCollectionView()
}

struct DisplayedSection {
	var isDisplayed: Bool = false
	var section: AssetSectionable
	
	init(section: AssetSectionable) {
		self.section = section
	}
}

class AssetViewModel {
	var sections = [AssetSectionable]()
	
	var delegate: AssetViewModelDelegate?
	
	init() {
		fetchDummyData()
	}
	
	private func fetchDummyData() {
		// assetCard
		var assetCardFooterModel = AssetCardFooterModel(title: "footer")
		assetCardFooterModel.delegate = self
		
		let assetCardSectionModel = AssetCardSectionModel(
			rowModels: [
				AssetCardRowModel(title: "row 1"),
				AssetCardRowModel(title: "row 2"),
				AssetCardRowModel(title: "row 3")],
			headerModel: AssetCardHeaderModel(title: "header"),
			footerModel: assetCardFooterModel
		)
		
		sections.append(AssetCardSection(model: assetCardSectionModel))
		
		// common
		let assetContentSectionModel = AssetContentSectionModel(
			rowModels: [
				AssetContentRowModel(title: "title 1", subTitle: "subTitle1", imageURL: ""),
				AssetContentRowModel(title: "title 2", subTitle: "subTitle2", imageURL: ""),
				AssetContentRowModel(title: "title 3", subTitle: "subTitle3", imageURL: ""),
				AssetContentRowModel(title: "title 4", subTitle: "subTitle4", imageURL: ""),
				AssetContentRowModel(title: "title 5", subTitle: "subTitle5", imageURL: ""),
				AssetContentRowModel(title: "title 6", subTitle: "subTitle6", imageURL: ""),
				AssetContentRowModel(title: "title 1", subTitle: "subTitle7", imageURL: ""),
				AssetContentRowModel(title: "title 2", subTitle: "subTitle8", imageURL: ""),
				AssetContentRowModel(title: "title 3", subTitle: "subTitle9", imageURL: ""),
				AssetContentRowModel(title: "title 4", subTitle: "subTitle10", imageURL: ""),
				AssetContentRowModel(title: "title 5", subTitle: "subTitle11", imageURL: ""),
				AssetContentRowModel(title: "title 6", subTitle: "subTitle12", imageURL: "")
			]
		)
		
		sections.append(AssetContentSection(model: assetContentSectionModel))
	}
}

extension AssetViewModel: AssetCardFooterDelegate {
	func foldButtonClicked(isFold: Bool) {
		
		// TODO: 이렇게 말고 다른 방법으로 뽑기
		if let sectionModel = sections[0].model as? AssetCardSectionModel {
			if isFold {
				sectionModel.rowCount = 1
			} else {
				sectionModel.rowCount = sectionModel.rowModels.count
			}
			delegate?.reloadCollectionView()
		}
	}
}
