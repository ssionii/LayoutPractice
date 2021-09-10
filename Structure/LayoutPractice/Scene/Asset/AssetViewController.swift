//
//  AssetViewController.swift
//  LayoutPractice
//
//  Created by Yang Siyeon on 2021/09/09.
//

import UIKit

class AssetViewController: UIViewController {

	private lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.allowsSelection = false
		collectionView.backgroundColor = .white
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		
		return collectionView
	}()
	
	private let viewModel = AssetViewModel()
	private let sectionFactory = AssetSectionFactory()
	
	init() {
		super.init(nibName: "AssetViewController", bundle: nil)
		
		self.title = "자산"
		self.tabBarItem = UITabBarItem(title: "자산", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
		
		
		
		viewModel.delegate = self
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		configureCollectionView()
    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
	}
	
	private func configureCollectionView() {
		
		sectionFactory.register(on: collectionView)
		view.addSubview(collectionView)
		
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		collectionView.contentInset = .init(top: 0, left: 0, bottom: 0, right: 0)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension AssetViewController: UICollectionViewDelegate {
	
}

extension AssetViewController: UICollectionViewDataSource {
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return viewModel.sections.count
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.sections[section].model.rowCount
	}
	
	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

		if kind == UICollectionView.elementKindSectionHeader {
			let section = viewModel.sections[indexPath.section]
			guard let view = sectionFactory.headerView(with: section, indexPath: indexPath) else {
				return UICollectionReusableView()
			}
			return view
		} else if kind == UICollectionView.elementKindSectionFooter {
			let section = viewModel.sections[indexPath.section]
			guard let view = sectionFactory.footerView(with: section, indexPath: indexPath) else {
				return UICollectionReusableView()
			}
			return view
		}

		return UICollectionReusableView()
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let section = viewModel.sections[indexPath.section]
		guard let cell = sectionFactory.rowCell(with: section, indexPath: indexPath) else {
			return UICollectionViewCell()
		}
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 0, left: horizontalMarginInMain, bottom: 0, right: horizontalMarginInMain)
	}
	
	func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
		print(indexPath)
	}
}

extension AssetViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let section = viewModel.sections[indexPath.section]
		return sectionFactory.rowCellSize(with: section, indexPath: indexPath)
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		return sectionFactory.headerViewSize(with: viewModel.sections[section], sectionIndex: section)
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
		return sectionFactory.footerViewSize(with: viewModel.sections[section], sectionIndex: section)
	}
}

extension AssetViewController: AssetViewModelDelegate {
	func reloadCollectionView() {
		collectionView.reloadData()
	}
}
