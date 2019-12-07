//
//  ResultViewController.swift
//  Project_Get_Word
//
//  Created by Давид on 05/12/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var resultLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.italicSystemFont(ofSize: 30)
        label.numberOfLines = 0
        label.layer.shadowRadius = 4
        label.layer.shadowOpacity = 0.5
        label.layer.shadowOffset = CGSize(width: 2, height: 3)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var scoreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.numberOfLines = 0
        label.text = "0"
        label.layer.shadowRadius = 4
        label.layer.shadowOpacity = 0.2
        label.layer.shadowOffset = CGSize(width: 2, height: 3)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var homeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9863776967, green: 0.9863776967, blue: 0.9863776967, alpha: 1)
        button.setTitle("Сохранить и выйти", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 2, height: 3)
        button.addTarget(self, action: #selector(homButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var tryAgainButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9863776967, green: 0.9863776967, blue: 0.9863776967, alpha: 1)
        button.setTitle("Продолжить", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 2, height: 3)
        button.addTarget(self, action: #selector(tryAgainButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    /// если раннее выигрывали, то продолжаем счет
    var scoreAfterWins = 0
    private let coreDataService = CoreDataService()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    }
    
    @objc func homButtonTapped() {
        guard let navigation = navigationController else { return }
        let mainVC = MainViewController()
        coreDataService.saveInStorage(data: Int16(scoreAfterWins))
        navigation.pushViewController(mainVC, animated: false)
    }
    
    @objc func tryAgainButtonTapped() {
        guard let navigation = navigationController else { return }
        let categoryVC = CategoryCollectionViewController()
        categoryVC.scoreAfterWin = scoreAfterWins
        navigation.pushViewController(categoryVC, animated: false)
    }
}
