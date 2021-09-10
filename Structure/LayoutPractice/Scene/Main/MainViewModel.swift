//
//  MainViewModel.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/01.
//

import Foundation
import UIKit

protocol SectionViewModel {
	// 안쓰고 싶을때를 대비해서 분리할 수 있도록
	var headerViewModel: HeaderViewModel? { get }
	var footerViewModel: FooterViewModel? { get }
	
	var rowViewModel: RowViewModel { get }
	var rowCount: Int { get }
}

protocol HeaderViewModel {
	var headerHeight: CGFloat { get }
}

protocol FooterViewModel {
	var footerHeight: CGFloat { get }
}

protocol RowViewModel {
	
}

extension SectionViewModel {
	var headerViewModel: HeaderViewModel? {
		return nil
	}
	
	var footerViewModel: FooterViewModel? {
		return nil
	}
	
	var rowCount: Int {
		return 1
	}
}
