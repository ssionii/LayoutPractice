//
//  Animator.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/08/30.
//

import Foundation
import UIKit

final class Animator {
	private var hasAnimatedAllCells = false
	private let animation: Animation

	init(animation: @escaping Animation) {
		self.animation = animation
	}

	func animate(cell: UITableViewCell, at indexPath: IndexPath, in tableView: UITableView) {
		guard !hasAnimatedAllCells else {
			return
		}

		animation(cell, indexPath, tableView)

		if let lastCell = tableView.visibleCells.last {
			hasAnimatedAllCells = lastCell == cell
		}
	}
}

typealias Animation = (UITableViewCell, IndexPath, UITableView) -> Void

enum AnimationFactory {
	static func makeMoveUpWithBounce(rowHeight: CGFloat, duration: TimeInterval, delayFactor: Double) -> Animation {
		return { cell, indexPath, tableView in
			cell.transform = CGAffineTransform(translationX: 0, y: 50)

			UIView.animate(
				withDuration: duration,
				delay: delayFactor * Double(indexPath.row),
				options: [.curveEaseInOut],
				animations: {
					cell.transform = CGAffineTransform(translationX: 0, y: 0)
			})
		}
	}
}
