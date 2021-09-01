//
//  MainSection.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/01.
//

import Foundation
import UIKit

protocol MainSection {
	var cellID: String { get }
	var content: MainContent { get }
	var headerViewID: String? { get }
	var footerViewID: String? { get }
}

extension MainSection {
	var headerViewID: String? {
		return nil
	}
	
	var footerViewID: String? {
		return nil
	}
}
