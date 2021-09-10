//
//  AssetContentSectionModel.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/10.
//

import Foundation
import UIKit

class AssetContentSectionModel: SectionModel {
	var rowCount: Int
	var rowModels: [RowModelable]
	
	init(rowModels: [AssetContentRowModel]) {
		self.rowModels = rowModels
		rowCount = rowModels.count
	}
}

struct AssetContentRowModel: RowModelable {
	var title: String
	var subTitle: String
	var imageURL: String
	
	init(title: String, subTitle: String, imageURL: String) {
		self.title = title
		self.subTitle = subTitle
		self.imageURL = imageURL
	}
}

extension AssetContentRowModel {
	func toImageTileModel() -> ImageTileModel {
		return ImageTileModel(
			title: title,
			subTitle: subTitle,
			imageURL: imageURL
		)
	}
}
