//
//  CategoryCollectionViewController.swift
//  Project_Get_Word
//
//  Created by Давид on 05/12/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell"

class CategoryCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let networkService = NetworkService()
    let collectionFlowLayout = UICollectionViewFlowLayout();
    var collectionView: UICollectionView!
    var defaultCategory = [Category(id: -1, name: "Имена")]
    /// если раннее выигрывали, то продолжаем счет
    var scoreAfterWin = 0
    private var categories = [Category]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionFlowLayout.minimumLineSpacing = 20
        collectionFlowLayout.scrollDirection = .vertical
        collectionView = UICollectionView.init(frame: view.frame, collectionViewLayout: collectionFlowLayout)
        self.collectionView!.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.reusedId)
        networkService.loadCategories { (categories) in
            guard let categories = categories else {
                self.categories = self.defaultCategory
                return
            }
            self.categories = categories
        }
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.view.addSubview(collectionView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    }

    // MARK: UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
        let category = categories[indexPath.row]
        configure(cell, with: category)
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
        cell.backgroundColor = #colorLiteral(red: 0.9863776967, green: 0.9863776967, blue: 0.9863776967, alpha: 1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let navigation = navigationController else { return }
        let gameVC = GameViewController()
        gameVC.category = "Категория: \n\n\(categories[indexPath.row].name)"
        gameVC.categoryWords = categories[indexPath.row]
        gameVC.scoreAfterWin = scoreAfterWin
        navigation.pushViewController(gameVC, animated: false)
        collectionView.deselectItem(at: indexPath, animated: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidthSize = (collectionView.frame.width - 60)
        return CGSize(width: itemWidthSize, height: 100)
    }

}

//// MARK: - Cell Configurator
extension CategoryCollectionViewController {
    func configure(_ cell: CategoryCollectionViewCell, with category: Category) {
        cell.categoryLabel.text = category.name
    }
}
