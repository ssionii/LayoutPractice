//
//  MyMenuCell.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/08/30.
//

import UIKit

class MyMenuCell: UITableViewCell {
	
	@IBOutlet weak var contentBackgroundView: UIView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var collectionView: UICollectionView!
	
	private var viewModel: MyMenuViewModel?
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	override func layoutSubviews() {
		self.configureUI()
		self.configureCollectionView()
	}
	
	func bind(viewModel: MyMenuViewModel) {
		self.viewModel = viewModel
	}
	
	private func configureUI() {
		contentBackgroundView.layer.cornerRadius = 14
		contentBackgroundView.layer.shadowOpacity = 0.12
		contentBackgroundView.layer.shadowColor = UIColor.black.cgColor
		contentBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 0)
		
		contentBackgroundView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: horizontalMarginInMain).isActive = true
		contentBackgroundView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -horizontalMarginInMain).isActive = true
	}
	
	private func configureCollectionView() {

		collectionView.register(UINib(nibName: MenuCell.ID, bundle: nil), forCellWithReuseIdentifier:  MenuCell.ID)
		
		collectionView.delegate = self
		collectionView.dataSource = self
	}
}

extension MyMenuCell: UICollectionViewDelegate,  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel?.myMenus.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCell.ID, for: indexPath) as! MenuCell
		guard let myMenu = self.viewModel?.myMenus[indexPath.row] else { return cell }
		cell.bind(text: myMenu.text, color: myMenu.color)
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 80, height: self.collectionView.frame.height)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		self.viewModel?.delegate?.clickMenu(viewModel?.myMenus[indexPath.row].text ?? "")
	}
}
