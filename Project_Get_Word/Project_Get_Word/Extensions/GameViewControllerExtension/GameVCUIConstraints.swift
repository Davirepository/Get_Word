//
//  ExtensionGameViewController.swift
//  Project_Get_Word
//
//  Created by Давид on 01/12/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

extension GameViewController {
    /// создаем кнопки, лейблы
    func setupUI() {
        scoreLabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 25)
            label.textColor = #colorLiteral(red: 0.9882260672, green: 1, blue: 0.3817092066, alpha: 1)
            label.layer.cornerRadius = 5
            label.clipsToBounds = true
            label.layer.borderWidth = 1
            label.layer.borderColor = UIColor.black.cgColor
            label.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        correctWordLabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 30)
            label.layer.cornerRadius = 5
            label.clipsToBounds = true
            label.layer.borderWidth = 1
            label.layer.borderColor = UIColor.black.cgColor
            label.backgroundColor = #colorLiteral(red: 0.9863776967, green: 0.9863776967, blue: 0.9863776967, alpha: 1)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        categoryLabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.layer.cornerRadius = 5
            label.clipsToBounds = true
            label.layer.borderWidth = 1
            label.layer.borderColor = UIColor.black.cgColor
            label.backgroundColor = #colorLiteral(red: 0.9863776967, green: 0.9863776967, blue: 0.9863776967, alpha: 1)
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        liveButtonsStackView = {
           let stack = HeartStack()
            stack.axis = .horizontal
            stack.distribution = .fillEqually
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        }()
        homeButton = {
           let button = UIButton()
//            button.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            button.backgroundColor = #colorLiteral(red: 0.7840276361, green: 0.9304812551, blue: 0.9022602439, alpha: 1)
            button.setImage(UIImage(named: "home1"), for: .normal)
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.shadowRadius = 4
            button.layer.shadowOpacity = 0.3
            button.layer.shadowOffset = CGSize(width: 2, height: 3)
            button.addTarget(self, action: #selector(homeButtonTapped), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        let collectionFlowLayout = UICollectionViewFlowLayout();
        collectionFlowLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        collectionFlowLayout.scrollDirection = .vertical
        collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: collectionFlowLayout)
        collectionView.register(GameCollectionViewCell.self, forCellWithReuseIdentifier: GameCollectionViewCell.reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = #colorLiteral(red: 0.2064514577, green: 0.5877810947, blue: 0.904348483, alpha: 1)
        collectionView.layer.cornerRadius = 10
        collectionView.layer.borderWidth = 1
        collectionView.layer.borderColor = UIColor.black.cgColor
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        view.addSubview(scoreLabel)
        view.addSubview(correctWordLabel)
        view.addSubview(collectionView)
        view.addSubview(liveButtonsStackView)
        view.addSubview(categoryLabel)
        view.addSubview(homeButton)
        
        let freeSpace = (view.frame.height - 240) / 2
        
        liveButtonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        liveButtonsStackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        liveButtonsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        liveButtonsStackView.trailingAnchor.constraint(equalTo: scoreLabel.leadingAnchor, constant: -10).isActive = true
        
        scoreLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        scoreLabel.widthAnchor.constraint(equalToConstant: 128).isActive = true
        scoreLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        categoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        categoryLabel.heightAnchor.constraint(equalToConstant: 120).isActive = true
        categoryLabel.topAnchor.constraint(lessThanOrEqualTo: liveButtonsStackView.bottomAnchor, constant: (freeSpace - 120) / 2).isActive = true
        
        correctWordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        correctWordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        correctWordLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        correctWordLabel.topAnchor.constraint(lessThanOrEqualTo: categoryLabel.bottomAnchor, constant: (freeSpace - 80) / 2).isActive = true
        
        homeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        homeButton.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -5).isActive = true
        homeButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
        homeButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
}
